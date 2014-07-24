//
//  ViewController.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var imageGravatar: UIImageView!
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationController.navigationBar.barTintColor = CONSTANTS().color1
    DataManager.sharedInstance.getResume(user_id: 1,
      onSuccess: {resume -> Void in
        dispatch_async(dispatch_get_main_queue(), {
          self.labelName.text = "\(resume.bio.firstName) \(resume.bio.lastName)"
          // get image
          let imageURL = NSURL(string: "https://secure.gravatar.com/avatar/" + resume.bio.email["work"]!.lowercaseString.md5() + "?s=256&d=mm")
          var dataTask = DataManager.sharedInstance.session.dataTaskWithURL(imageURL, completionHandler: {data, response, error -> Void in
            if !error {
              dispatch_async(dispatch_get_main_queue(), {
                let image = UIImage(data: data)
                self.imageGravatar.image = image
              })
            }
          })
          dataTask.resume()
        })
      },
      onFailure:nil
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

