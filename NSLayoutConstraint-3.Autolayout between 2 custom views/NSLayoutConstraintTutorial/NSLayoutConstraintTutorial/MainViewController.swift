//
//  MainViewController.swift
//  NSLayoutConstraintTutorial
//
//  Created by Nguyen Duc Hoang on 4/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var label1:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Label 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var label2:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Label 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func autolayoutLabel1() {
        view.addSubview(label1)
        view.addConstraint(NSLayoutConstraint(item: label1,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 40))
        
        view.addConstraint(NSLayoutConstraint(item: label1,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .left,
                                              multiplier: 1,
                                              constant: 40))
        
        view.addConstraint(NSLayoutConstraint(item: label1,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1,
                                              constant: 100))
        
        view.addConstraint(NSLayoutConstraint(item: label1,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1,
                                              constant: 50))
    }
    private func autolayoutLabel2() {
        view.addSubview(label2)
        view.addConstraint(NSLayoutConstraint(item: label2,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: label1,
                                              attribute: .height,
                                              multiplier: 1,
                                              constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: label2,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: label1,
                                              attribute: .width,
                                              multiplier: 1,
                                              constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: label2,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: label1,
                                              attribute: .right,
                                              multiplier: 1,
                                              constant: 20))
        
        view.addConstraint(NSLayoutConstraint(item: label2,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: label1,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 55 / 255, green: 117/255, blue: 67 / 255, alpha: 1)
        autolayoutLabel1()
        autolayoutLabel2()
    

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
