//
//  MainViewController.swift
//  SwiftTutorial
//
//  Created by Nguyen Duc Hoang on 4/19/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var circleView: UIView = {
        let myView = UIView()
        myView.backgroundColor = UIColor.orange
        myView.layer.cornerRadius = 50
        myView.layer.masksToBounds = true
        myView.alpha = 0.0
        myView.frame = CGRect(x: 0, y: 0,
                              width: 100, height: 100)
        myView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        return myView
    }()
    
    var lblSubject: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        label.text = "IOS swift development"
        label.sizeToFit()
        label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height + 100)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(circleView)
        view.addSubview(lblSubject)
        UIView.animate(withDuration: 1.8, animations: { 
            //Final frame(animation's state)
            self.circleView.alpha = 1.0
        }) { (finished) in
            //After finished this animation
            UIView.animate(withDuration: 1.2, animations: { 
                self.lblSubject.center = CGPoint(x: self.lblSubject.center.x, y: self.circleView.center.y + 100)
            }, completion: { (finished) in
                
            })
        }
    }    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
