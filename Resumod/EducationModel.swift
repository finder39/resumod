//
//  EducationModel.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class EducationModel {
  var institution:String = ""
  var area:String = ""
  var studyType:String = ""
  var startDate:String = ""
  var endDate:String = ""
  var summary:String = ""
  var courses:[String] = []
  
  init() {
    
  }
  
  init(fromJSONData json:Dictionary<String, AnyObject>) {
    if let institution = (json["institution"] as AnyObject?) as? String {
      self.institution = institution
    }
    if let area = (json["area"] as AnyObject?) as? String {
      self.area = area
    }
    if let studyType = (json["studyType"] as AnyObject?) as? String {
      self.studyType = studyType
    }
    if let startDate = (json["startDate"] as AnyObject?) as? String {
      self.startDate = startDate
    }
    if let endDate = (json["endDate"] as AnyObject?) as? String {
      self.endDate = endDate
    }
    if let summary = (json["summary"] as AnyObject?) as? String {
      self.summary = summary
    }
    if let courses = (json["courses"] as AnyObject?) as? [String] {
      for course in courses {
        self.courses.append(course)
      }
    }
  }
}