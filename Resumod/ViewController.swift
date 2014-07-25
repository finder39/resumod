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
  @IBOutlet weak var textBioInfo: UITextView!
  @IBOutlet weak var textBioInfoHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageGravatar: UIImageView!
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationController.navigationBar.barTintColor = CONSTANTS().color1
    
    // selectable has to be true in storyboard or accessing font (and thus font size) will crash it
    for theView in self.view.subviews {
      if theView is UITextView {
        (theView as UITextView).selectable = false
      }
    }
    
    DataManager.sharedInstance.getResume(user_id: 1,
      onSuccess: {resume -> Void in
        dispatch_async(dispatch_get_main_queue(), {
          self.labelName.text = "\(resume.bio.firstName) \(resume.bio.lastName)"
          
          // setup and display location
          var location = ""
          if let locationCity = resume.bio.location["city"] {
            location = locationCity
          }
          if let locationState = resume.bio.location["state"] {
            location += ", \(locationState)"
          }
          self.labelLocation.text = location
          
          // setup and display bio info
          var bioInfo = NSMutableAttributedString()
          for (key, value) in resume.bio.email {
            if !value.isEmpty {
              var email = NSMutableAttributedString(string: "Email: \(value)")
              email.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(self.textBioInfo.font.pointSize), range: NSMakeRange(0, 6))
              bioInfo.appendAttributedString(email)
            }
          }
          for (key, value) in resume.bio.profiles {
            if !value.isEmpty {
              var profile = NSMutableAttributedString(string: "\n\(key): \(value)")
              profile.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(self.textBioInfo.font.pointSize), range: NSMakeRange(1, key.utf16Count+1))
              bioInfo.appendAttributedString(profile)
            }
          }
          self.textBioInfo.attributedText = bioInfo
          self.textBioInfoHeightConstraint.constant = ceil(self.textBioInfo.sizeThatFits(CGSizeMake(self.textBioInfo.frame.size.width, CGFloat.max)).height)
          
          self.textSummary.text = resume.bio.summary
          self.textSummaryHeightConstraint.constant = ceil(self.textSummary.sizeThatFits(CGSizeMake(self.textSummary.frame.size.width, CGFloat.max)).height)
          
          // get image
          let imageURL = "https://secure.gravatar.com/avatar/" + resume.bio.email["work"]!.lowercaseString.md5() + "?s=256&d=mm"
          DataManager.sharedInstance.setImageView(self.imageGravatar, withURL: imageURL)
        })
      }
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}