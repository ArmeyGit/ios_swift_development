//
//  MainViewController.swift
//  NSLayoutConstraintTutorial
//
//  Created by Nguyen Duc Hoang on 4/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var centerView:UIView = {
        let myView = UIView()
        myView.backgroundColor = UIColor.red
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 55 / 255, green: 117/255, blue: 67 / 255, alpha: 1)
        view.addSubview(centerView)
        view.addConstraint(NSLayoutConstraint(item: centerView,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 40))
        
        view.addConstraint(NSLayoutConstraint(item: centerView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: -40))
        
        view.addConstraint(NSLayoutConstraint(item: centerView,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .left,
                                              multiplier: 1,
                                              constant: 20))
        
        view.addConstraint(NSLayoutConstraint(item: centerView,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .right,
                                              multiplier: 1,
                                              constant: -20))
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
