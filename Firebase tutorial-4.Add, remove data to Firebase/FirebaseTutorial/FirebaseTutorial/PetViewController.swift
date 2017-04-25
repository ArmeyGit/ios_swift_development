//
//  PetViewController.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/21/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit
import Firebase

class PetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView:UITableView?
    var pets: [Pet] = [Pet]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: tableView ?? UITableView(), attribute: .top,
                                              relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView ?? UITableView(), attribute: .right,
                                              relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView ?? UITableView(), attribute: .bottom,
                                              relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView ?? UITableView(), attribute: .left,
                                              relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        
        tableView?.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: "PetTableViewCell")
        // Do any additional setup after loading the view.
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
            let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
            let dictPets = dictRoot["pets"] as? [String: AnyObject] ?? [:]
            self.pets = [Pet]()
            for key in Array(dictPets.keys) {
                self.pets.append(Pet(dictionary: dictPets[key] as! [String: AnyObject], key: key))
            }
            self.tableView?.reloadData()
            print(dictPets)
        })
        self.customizeNavigationBar()
    }
    
    func customizeNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 68 / 255, green: 169 / 255, blue: 128 / 255, alpha: 1)
//        navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Pets list"
        navigationController?.navigationBar.isTranslucent = false;
        
        let btnAdd = UIButton(type: .custom)
        btnAdd.setImage(#imageLiteral(resourceName: "icon_pet"), for: .normal)
        btnAdd.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnAdd.addTarget(self, action: #selector(btnAdd(sender:)), for: .touchUpInside)
        let rightButton = UIBarButtonItem(customView: btnAdd)
        navigationItem.setRightBarButton(rightButton, animated: true)
    }
    @IBAction func btnAdd(sender: AnyObject) {
        print("press btnAdd")
        var txtPetName: UITextField?
        var txtPetAge: UITextField?
        let actionSheetController: UIAlertController = UIAlertController(title: "Add Pet",
                                                                         message: "Input Pet's information:",
                                                                         preferredStyle: .alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Save", style: .default) { action -> Void in
            //Do some other stuff
            if(txtPetName?.text == nil || txtPetName?.text == "") {
                return
            }
            
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("pets").child(txtPetName!.text ?? "")
                .setValue(["name": txtPetName?.text ?? "",
                           "age": txtPetAge?.text ?? ""])
        }
        actionSheetController.addAction(nextAction)
        
        //Add a text field
        actionSheetController.addTextField { (textField) in
            textField.placeholder = "Enter pet's name"
            txtPetName = textField
        }
        
        //Add a text field
        actionSheetController.addTextField { (textField) in
            textField.placeholder = "Enter pet's age"
            txtPetAge = textField
        }
        
        //Present the AlertController
        self.present(actionSheetController, animated: true) { 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath) as! PetTableViewCell
        let eachPet = pets[indexPath.row]
        cell.lblPetName.text = eachPet.name
        cell.lblPetAge.text = String(format: "Age: \(eachPet.age)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            let deletingPet = self.pets[indexPath.row]
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("pets").child(deletingPet.name).removeValue()
        }
    }
}
