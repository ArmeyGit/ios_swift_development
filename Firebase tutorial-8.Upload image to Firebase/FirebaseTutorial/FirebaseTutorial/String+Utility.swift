//
//  String+Utility.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation

extension String {
    static func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        //return a ramdomize string => image name..
        return randomString
    }
}
