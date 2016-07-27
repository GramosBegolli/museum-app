//
//  ExtensionUtility.swift
//  Museum
//
//  Created by Gramos Begolli on 7/27/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        // Trim leading '#' if needed
        var cleanedHexString = hexString
        if hexString.hasPrefix("#") {
            //            cleanedHexString = dropFirst(hexString) // Swift 1.2
            cleanedHexString = String(hexString.characters.dropFirst()) // Swift 2
        }
        
        // String -> UInt32
        var rgbValue: UInt32 = 0
        NSScanner(string: cleanedHexString).scanHexInt(&rgbValue)
        
        // UInt32 -> R,G,B
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}