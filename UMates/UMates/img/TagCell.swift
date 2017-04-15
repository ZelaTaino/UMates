//
//  TagCell.swift
//  UMates
//
//  Created by Austin Prince on 4/11/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {

    @IBOutlet weak var tagName: UILabel!
    
    @IBOutlet weak var maxWidthConstraint: NSLayoutConstraint!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red: 0.76, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        self.tagName.textColor = UIColor(red: 0.76, green: 0.0, blue: 0.0, alpha: 1.0)
        self.maxWidthConstraint.constant = UIScreen.main.bounds.width - 8 * 2 - 8 * 2 
        
        // Initialization code
    }

   
    

}
