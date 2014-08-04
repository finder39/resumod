//
//  Constants.swift
//  Resumod
//
//  Created by Joseph Neuman on 7/23/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

import Foundation
import UIKit

struct CONSTANTS {
  /*enum Palette {
    case VeryLightPastelRedBlueYellow
    case DarkRedBlueYellow
  }
  
  let paletteToUse = Palette.VeryLightPastelRedBlueYellow
  
  switch (paletteToUse) {
    case .VeryLightPastelRedBlueYellow:
      let color1 = "a"
  }*/
  
  // http://www.paletton.com/#uid=33K0I0kiCFn8GVde7NVmtwSqXtg
  let color1 = UIColor(red: 1, green: 0.945, blue: 0.42, alpha: 1)
  let color2 = UIColor(red: 0.369, green: 0.498, blue: 0.776, alpha: 1)
  let color3 = UIColor(red: 1, green: 0.576, blue: 0.42, alpha: 1)
}

/*class Constants {
  /*class var sharedInstance:Constants {
  struct Static {
    static let instance = Constants()
    }
    return Static.instance
  }*/
  
  let constants = constantsStruct()
}*/

extension String {
  func md5() -> String! {
    let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
    
    CC_MD5(str!, strLen, result)
    
    var hash = NSMutableString()
    for i in 0..<digestLen {
      hash.appendFormat("%02x", result[i])
    }

    result.destroy()
    
    return String(format: hash)
  }
}