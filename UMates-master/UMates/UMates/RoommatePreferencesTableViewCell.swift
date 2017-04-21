//
//  RoommatePreferencesTableViewCell.swift
//  UMates
//
//  Created by Glizela Taino on 4/15/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class RoommatePreferencesTableViewCell: UITableViewCell {

    @IBOutlet weak var options: UILabel!
    @IBOutlet weak var preference: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
