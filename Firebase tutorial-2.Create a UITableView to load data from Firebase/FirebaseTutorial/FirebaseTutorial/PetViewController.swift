//
//  PetViewController.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/21/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class PetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView:UITableView?
    var pets: [String: AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView?.backgroundColor = UIColor.red
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
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
            let dictPets = snapshot.value as? [String : AnyObject] ?? [:]
            self.pets = dictPets["pets"] as! [String : AnyObject]
            self.tableView?.reloadData()
            print(dictPets)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as UITableViewCell
        self.pets.keys
//        cell.textLabel?.text = pets[pets.keys[indexPath.row] as! String]["name"] as? String
        return cell
    }
    

}
