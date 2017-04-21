//
//  QuestionnaireMainTableViewCell.swift
//  UMates
//
//  Created by Glizela Taino on 4/10/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class QuestionnaireMainTableViewCell: UITableViewCell {
    @IBOutlet weak var instructionTitle: UILabel!
    @IBOutlet weak var instructionDescript: UILabel!
    @IBOutlet weak var checkboxImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkboxImg.image = UIImage(named: "img/checkboxImg")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
