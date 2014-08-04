//
//  DataManager.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/18/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation
import UIKit

class DataManager : NSObject {
  //initiation of sharedInstance
  class var sharedInstance:DataManager {
    struct Static {
      static let instance = DataManager()
    }
    return Static.instance
  }
  
  let session = NSURLSession.sharedSession()
  
  // private functions
  
  func getTestResume(#onSuccess:(resume:ResumeModel)->(), onFailure:((error:NSError)->())?) {
    let path = NSBundle.mainBundle().pathForResource("ExampleResume", ofType: "json")
    let url = NSURL(fileURLWithPath: path)
    var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
      if error {
        println(error.localizedDescription)
      }
      var err: NSError?
      var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? Dictionary<String, AnyObject>
      if err != nil {
        println(err)
        println("JSON Error \(err!.localizedDescription)")
      }
      var results: Dictionary = jsonResult! as Dictionary
      // here is where I'd call the callback or delegate method
      dispatch_async(dispatch_get_main_queue(), {
        //doing main thread things
        onSuccess(resume: ResumeModel(fromJSONData: results))
        })
      })
    task.resume()
  }
  
  // Using closure (swift equivilent of blocks)
  func getResume(#user_id:Int, onSuccess:(resume:ResumeModel)->(), onFailure:((error:NSError)->())?) {
    let url = NSURL(string: "https://gist.githubusercontent.com/finder39/35336449bb3092a25821/raw/3b8d831067b5eaa34ee811198ebb173dbc126d8c/resume.json")
    var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
      if error {
        println(error.localizedDescription)
      }
      var err: NSError?
      var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? Dictionary<String, AnyObject>
      if err != nil {
        println(err)
        println("JSON Error \(err!.localizedDescription)")
      }
      var results: Dictionary = jsonResult! as Dictionary
      // here is where I'd call the callback or delegate method
      dispatch_async(dispatch_get_main_queue(), {
        //doing main thread things
        onSuccess(resume: ResumeModel(fromJSONData: results))
      })
    })
    task.resume()
  }
  
  func getResume(#user_id:Int, onSuccess:(resume:ResumeModel)->()) {
    getResume(user_id: user_id, onSuccess: onSuccess, onFailure: nil)
  }
  
  func setImageView(imageView:UIImageView, withURL imageURL:String) {
    let url = NSURL(string: imageURL)
    var dataTask = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
      if !error {
        dispatch_async(dispatch_get_main_queue(), {
          let image = UIImage(data: data)
          imageView.image = image
          })
      }
      })
    dataTask.resume()
  }
}