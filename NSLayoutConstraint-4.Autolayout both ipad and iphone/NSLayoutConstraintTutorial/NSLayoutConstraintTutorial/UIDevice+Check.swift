//
//  UIDevice+Check.swift
//  NSLayoutConstraintTutorial
//
//  Created by Nguyen Duc Hoang on 4/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit
extension UIDevice {
    static func isIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static func isIPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static func getFloatValue(iphone: CGFloat, ipad: CGFloat) -> CGFloat {
        if(UIDevice.isIPhone()) {
            return iphone
        } else if(UIDevice.isIPad()) {
            return ipad
        }
        return 0
    }

}
