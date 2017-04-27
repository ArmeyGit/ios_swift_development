//
//  Pet.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/25/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation

class Pet {
    var key: String
    var name: String
    var age: Int
    var imageName: String
    
    init(dictionary: [String: AnyObject], key: String) {
        self.key = key
        self.name = dictionary["name"] as! String
        self.age = Int(dictionary["age"] as! String) ?? 0
        self.imageName = (dictionary["imageName"] as? String) ?? ""
        
    }
}
