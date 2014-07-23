//
//  DataManagerTest.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/23/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import UIKit
import XCTest
import Resumod

class DataManagerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  
  // Helpers
  func createUniqueInstance() -> DataManager {
    return DataManager()
  }
  
  func getSharedInstance() -> DataManager {
    return DataManager.sharedInstance
  }
  
  // Tests
  func testSingletonSharedInstanceCreated() {
    XCTAssertNotNil(getSharedInstance())
  }
  
  func testSingletonUniqueInstanceCreated() {
    XCTAssertNotNil(createUniqueInstance())
  }
  
  func testSingletonReturnsSameSharedInstances() {
    var s1 = getSharedInstance()
    var s2 = getSharedInstance()
    XCTAssertEqual(s1, s2)
  }
  
  func testSingletonSharedInstanceSameAsUniqueInstance() {
    var s1 = getSharedInstance()
    var s2 = createUniqueInstance()
    XCTAssertNotEqual(s1, s2)
  }
  
  func testSingletonReturnsSameUniqueInstances() {
    var s1 = createUniqueInstance()
    var s2 = createUniqueInstance()
    XCTAssertNotEqual(s1, s2)
  }
}
