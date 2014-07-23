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
    if let work = (json["work"] as AnyObject?) as? Dictionary<String, AnyObject> {
      for workItem in work {
        self.work += WorkModel(fromJSONData: json["work"]! as Dictionary)
      }
    }
    if let education = (json["education"] as AnyObject?) as? Dictionary<String, AnyObject> {
      for educationItem in education {
        self.education += EducationModel(fromJSONData: json["education"]! as Dictionary)
      }
    }
    if let skills = (json["skills"] as AnyObject?) as? Dictionary<String, AnyObject> {
      for skill in skills {
        self.skills += SkillModel(fromJSONData: json["skills"]! as Dictionary)
      }
    }
  }
}