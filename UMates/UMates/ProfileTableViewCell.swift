//
//  ProfileTableViewCell.swift
//  UMates
//
//  Created by Glizela Taino on 4/6/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var major: UILabel!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var moveInDate: UILabel!
    @IBOutlet weak var budgetImg: UIImageView!
    @IBOutlet weak var moveInDateImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        budgetImg.image = UIImage(named:"img/budgetImage.png")
        moveInDateImg.image = UIImage(named:"img/moveInDateImage.png");
    }
    
    func setProfileImage(image: UIImage){
        profileImg.image = image
    }
    
    func setName(name: String){
        self.name.text = name
    }

    func setMajor(major: String){
        self.major.text = major
    }
    
    func setBudget(budget: String){
        self.budget.text = budget
    }
    
    func setMoveInDate(moveInDate: String){
        self.moveInDate.text = moveInDate
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
