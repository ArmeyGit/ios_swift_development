//
//  PetViewController.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/24/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {
    @IBOutlet weak var txtPetName:UITextField!
    @IBOutlet weak var txtPetAge:UITextField!
    @IBOutlet weak var imageViewPet:UIImageView!
    @IBOutlet weak var btnInsertAndUpload:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPetName.translatesAutoresizingMaskIntoConstraints = false
        txtPetAge.translatesAutoresizingMaskIntoConstraints = false
        imageViewPet.translatesAutoresizingMaskIntoConstraints = false
        btnInsertAndUpload.translatesAutoresizingMaskIntoConstraints = false
        
        txtPetName.placeholder = "Enter your pet's name"
        txtPetAge.placeholder = "Pet's age"
        txtPetName.layer.borderColor = UIColor.lightGray.cgColor
        
        btnInsertAndUpload.isHidden = true
        
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .top, relatedBy: .equal,
                                              toItem: view, attribute: .top, multiplier: 1, constant: 30))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .left, relatedBy: .equal,
                                              toItem: view, attribute: .left, multiplier: 1, constant: 30))
        
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .height, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .height, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .left, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .top, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .bottom, multiplier: 1, constant: 20))
        
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .top, relatedBy: .equal,
                                              toItem: txtPetAge, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .left, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .width, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .width, relatedBy: .equal,
                                              toItem: imageViewPet, attribute: .height, multiplier: 1, constant: 0))
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
