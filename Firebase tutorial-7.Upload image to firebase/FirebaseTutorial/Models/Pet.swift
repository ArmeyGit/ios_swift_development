//
//  Pet.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/22/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import Firebase

class Pet {
    var key: String
    var name: String
    var age: Int
    
    init(dictionary: [String: AnyObject], key: String) {
        self.key = key
        self.name = dictionary["name"] as! String
        self.age = Int(dictionary["age"] as! String) ?? 0
        
    }
}
