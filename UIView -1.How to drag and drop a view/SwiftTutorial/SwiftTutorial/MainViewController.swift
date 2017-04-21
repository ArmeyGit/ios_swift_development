//
//  MainViewController.swift
//  SwiftTutorial
//
//  Created by Nguyen Duc Hoang on 4/19/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var dragAndDropView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = UIColor.blue
        myView.layer.cornerRadius = 50
        myView.layer.masksToBounds = true
        return myView
    }()
    var newCoord: CGPoint = CGPoint(x: 0, y: 0)
    var firstCoord: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(dragAndDropView)
        view.addConstraint(NSLayoutConstraint(item: dragAndDropView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
            
        view.addConstraint(NSLayoutConstraint(item: dragAndDropView, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .height, multiplier: 1, constant: 100))
        
        view.addConstraint(NSLayoutConstraint(item: dragAndDropView, attribute: .left, relatedBy: .equal,
                                              toItem: view, attribute: .left, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: dragAndDropView, attribute: .top, relatedBy: .equal,
                                              toItem: view, attribute: .top, multiplier: 1, constant: 20))
        
        let panGestureToCell = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        panGestureToCell.minimumPressDuration = 0.0
        dragAndDropView.addGestureRecognizer(panGestureToCell)
        // Do any additional setup after loading the view.
    }
    func handlePan(recognizer: UIPanGestureRecognizer) {
        if(recognizer.view == nil) {
            return
        }
        if(recognizer.state == UIGestureRecognizerState.began) {
            
        } else if(recognizer.state == UIGestureRecognizerState.ended) {
            
        }
        self.newCoord = recognizer.location(in: self.view)
        let x = self.newCoord.x - (recognizer.view?.frame.width ?? 0) / 2
        let y = self.newCoord.y - (recognizer.view?.frame.height ?? 0) / 2
        dragAndDropView.frame = CGRect(x: x, y: y, width: dragAndDropView.frame.width, height: dragAndDropView.frame.height)
        print("New coordinator : x = \(x), y = \(y)")
        view.bringSubview(toFront:dragAndDropView)
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
