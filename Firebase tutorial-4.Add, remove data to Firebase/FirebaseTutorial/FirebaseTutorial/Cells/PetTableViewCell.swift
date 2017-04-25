//
//  PetTableViewCell.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/22/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    @IBOutlet weak var imgageViewPet: UIImageView!
    @IBOutlet weak var lblPetName: UILabel!
    @IBOutlet weak var lblPetAge: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgageViewPet?.translatesAutoresizingMaskIntoConstraints = false
        lblPetName?.translatesAutoresizingMaskIntoConstraints = false
        lblPetAge?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .left, relatedBy: .equal,
                                              toItem: self, attribute: .left, multiplier: 1, constant: 10))
        
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .top, relatedBy: .equal,
                                              toItem: self, attribute: .top, multiplier: 1, constant: 10))
        
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .bottom, relatedBy: .equal,
                                              toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .width, relatedBy: .equal,
                                              toItem: imgageViewPet, attribute: .height, multiplier: 1, constant: 0))
        imgageViewPet.image = #imageLiteral(resourceName: "icon_pet")
        
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .right, relatedBy: .equal,
                                              toItem: lblPetName, attribute: .left, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: imgageViewPet, attribute: .top, relatedBy: .equal,
                                              toItem: lblPetName, attribute: .top, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: lblPetAge, attribute: .left, relatedBy: .equal,
                                              toItem: lblPetName, attribute: .left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: lblPetAge, attribute: .bottom, relatedBy: .equal,
                                              toItem: imgageViewPet, attribute: .bottom, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
