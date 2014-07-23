//
//  ResumeTest.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/23/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import UIKit
import XCTest

class ResumeTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

  func testBioDataLoadedCorrectly() {
    var expectation = self.expectationWithDescription("getTestResume")
    
    DataManager.sharedInstance.getTestResume(onSuccess: {resume -> Void in
      XCTAssertEqual(resume.version, "0.0.2", "Version wrong")
      XCTAssertEqual(resume.bio.firstName, "Joseph", "firstName wrong")
      XCTAssertEqual(resume.bio.email["personal"]!, "blank@gmail.com", "email personal wrong")
      XCTAssertEqual(resume.work[1].company, "Got Apps Inc", "work company name wrong")
      XCTAssertEqual(resume.work[0].highlights[0], "Developed and assisted in the design of the iOS application.", "work highlight wrong")
      XCTAssertEqual(resume.education[0].institution, "Northern Illinois University", "education institution wrong")
      expectation.fulfill()
      }, onFailure: nil)
    
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }
}
