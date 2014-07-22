//
//  ViewController.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    DataManager.sharedInstance.getTestResume()
    DataManager.sharedInstance.getResume(user_id: 1,
      onSuccess: {resume -> Void in
        println(resume.version)
        println(resume.bio.firstName)
        println(resume.bio.email["personal"])
      },
      onFailure:nil
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

