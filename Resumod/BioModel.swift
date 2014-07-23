//
//  BioModel.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/16/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation

class BioModel {
  var firstName:String = ""
  var lastName:String = ""
  var email:Dictionary<String, String> = ["work": "", "personal": ""]
  var phone:Dictionary<String, String> = ["work": "", "personal": ""]
  /*struct email {
    var work:String = ""
    var personal:String = ""
  }
  struct phone {
    var work:String = ""
    var personal:String = ""
  }*/
  var summary:String = ""
  var location:Dictionary<String, String> = ["city": "", "countryCode": "", "region": "", "state": ""]
  var websites:Dictionary<String, String> = ["blog":""]
  var profiles:Dictionary<String, String> = ["facebook":"", "twitter":"", "github":"", "linkedin":""]
  /*struct location {
    var city:String = ""
    var countryCode:String = ""
    var region:String = ""
    var state:String = ""
  }
  var websites:Dictionary<String, String> = ["blog":""]
  struct profiles {
    var twitter:String = ""
    var facebook:String = ""
    var github:String = ""
    var linkedin:String = ""
  }*/
  
  init() {
    
  }
  
  init(fromJSONData json:Dictionary<String, AnyObject>) {
    firstName = (json["firstName"] as AnyObject?) as String
    lastName = (json["lastName"] as AnyObject?) as String
    if let emails = (json["email"] as AnyObject?) as? Dictionary<String, String> {
      for (type, email) in emails {
        self.email[type] = email
      }
    }
    if let phones:Dictionary<String, String> = (json["phone"] as AnyObject?) as? Dictionary<String, String> {
      for (type, phone) in phones {
        self.phone[type] = phone
      }
    }
    if let summary = (json["summary"] as AnyObject?) as? String {
      self.summary = summary
    }
    if let locations = (json["location"] as AnyObject?) as? Dictionary<String, String> {
      for (type, location) in locations {
        self.location[type] = location
      }
    }
    if let websites = (json["websites"] as AnyObject?) as? Dictionary<String, String> {
      for (type, website) in websites {
        self.websites[type] = website
      }
    }
    if let profiles = (json["phone"] as AnyObject?) as? Dictionary<String, String> {
      for (type, profile) in profiles {
        self.profiles[type] = profile
      }
    }
  }
}