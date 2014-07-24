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
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationController.navigationBar.barTintColor = CONSTANTS().color1
    DataManager.sharedInstance.getResume(user_id: 1,
      onSuccess: {resume -> Void in
        dispatch_async(dispatch_get_main_queue(), {
          self.labelName.text = "\(resume.bio.firstName) \(resume.bio.lastName)"
          });
      },
      onFailure:nil
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

