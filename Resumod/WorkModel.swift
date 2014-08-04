//
//  WorkModel.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class WorkModel {
  var company:String = ""
  var position:String = ""
  var website:String = ""
  var startDate:String = ""
  var endDate:String = ""
  var summary:String = ""
  var highlights:[String] = []
  
  init() {
    
  }
  
  init(fromJSONData json:Dictionary<String, AnyObject>) {
    if let company = (json["company"] as AnyObject?) as? String {
      self.company = company
    }
    if let position = (json["position"] as AnyObject?) as? String {
      self.position = position
    }
    if let website = (json["website"] as AnyObject?) as? String {
      self.website = website
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
    if let highlights = (json["highlights"] as AnyObject?) as? [String] {
      for highlight in highlights {
        self.highlights.append(highlight)
      }
    }
  }
}