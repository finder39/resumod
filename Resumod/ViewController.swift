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
  @IBOutlet weak var labelLocation: UILabel!
  @IBOutlet weak var textSummary: UITextView!
  @IBOutlet weak var textSummaryHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageGravatar: UIImageView!
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationController.navigationBar.barTintColor = CONSTANTS().color1
    self.textSummaryHeightConstraint.constant = ceil(self.textSummary.sizeThatFits(CGSizeMake(self.textSummary.frame.size.width, CGFloat.max)).height)
    
    DataManager.sharedInstance.getResume(user_id: 1,
      onSuccess: {resume -> Void in
        dispatch_async(dispatch_get_main_queue(), {
          self.labelName.text = "\(resume.bio.firstName) \(resume.bio.lastName)"
          
          var location = ""
          if let locationCity = resume.bio.location["city"] {
            location = locationCity
          }
          if let locationState = resume.bio.location["state"] {
            location += ", \(locationState)"
          }
          self.labelLocation.text = location
          self.textSummary.text = resume.bio.summary
          
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

