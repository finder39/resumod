//
//  SkillsModel.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/18/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class SkillModel {
  var name:String = "" // e.g. We Developement
  var level:String = "" // e.g. Master
  var keywords:[String] = [] // List some keywords pertaining to this skill e.g. HTML
  
  init() {
    
  }
  
  init(fromJSONData json:Dictionary<String, AnyObject>) {
    if let name = (json["name"] as AnyObject?) as? String {
      self.name = name
    }
    if let level = (json["level"] as AnyObject?) as? String {
      self.level = level
    }
    if let keywords = (json["keywords"] as AnyObject?) as? [String] {
      for keyword in keywords {
        self.keywords.append(keyword)
      }
    }
  }
}