//
//  DataManager.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/18/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class DataManager {
  //initiation of sharedInstance
  class var sharedInstance:DataManager {
    struct Static {
      static let instance = DataManager()
    }
    return Static.instance
  }
  
  let session = NSURLSession.sharedSession()
  
  // private functions
  
  func getTestResume() -> ResumeModel {
    let testResume:Dictionary<String, AnyObject> = [ "version":"0.0.1", "bio":[ "firstName":"Joseph", "lastName":"Neuman", "email":[ "personal":"blank@gmail.com" ] ] ]
    var resume = ResumeModel(fromJSONData: testResume);
    
    return resume
  }
  
  // Using closure (swift equivilent of blocks)
  func getResume(#user_id:Int, onSuccess:(resume:ResumeModel)->(), onFailure:((error:NSError)->())?) {
    let url = NSURL(string: "https://gist.githubusercontent.com/finder39/35336449bb3092a25821/raw/b2dd9d162d40ad8916dd4b1c34529deb8963d9fc/resume.json")
    var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
      println("Task completed")
      if error {
        println(error.localizedDescription)
      }
      var err: NSError?
      var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? Dictionary<String, AnyObject>
      if err? {
        println("JSON Error \(err!.localizedDescription)")
      }
      var results: Dictionary = jsonResult as Dictionary
      // here is where I'd call the callback or delegate method
      dispatch_async(dispatch_get_main_queue(), {
        //doing main thread things
        onSuccess(resume: ResumeModel(fromJSONData: results))
      })
      println("Success!")
    })
    task.resume()
  }
}