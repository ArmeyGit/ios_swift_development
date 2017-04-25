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
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
        pets = [Pet]()
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
            let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
            let dictPets = dictRoot["pets"] as? [String: AnyObject] ?? [:]
            for key in Array(dictPets.keys) {
                self.pets.append(Pet(dictionary: dictPets[key] as! [String: AnyObject], key: key))
            }
            self.tableView?.reloadData()
            print(dictPets)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as UITableViewCell
        let eachPet = pets[indexPath.row]
        cell.textLabel?.text = "Name: \(eachPet.name), age: \(eachPet.age)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
