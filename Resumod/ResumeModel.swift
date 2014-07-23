//
//  ResumeModel.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class ResumeModel {
  let version:String = ""
  var bio:BioModel = BioModel()
  var work:[WorkModel] = []
  var education:[EducationModel] = []
  var awards:[AnyObject] = []
  var publications:[AnyObject] = []
  var skills:[SkillModel] = []
  var hobbies:[AnyObject] = []
  var references:[AnyObject] = []
  
  init() {
    
  }
  
  init(fromJSONData json:Dictionary<String, AnyObject>) {
    if let version = (json["version"] as AnyObject?) as? String {
      self.version = version
    }
    if let bio = (json["bio"] as AnyObject?) as? Dictionary<String, AnyObject> {
      self.bio = BioModel(fromJSONData: json["bio"]! as Dictionary)
    }
  }
}