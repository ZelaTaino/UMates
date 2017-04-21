//
//  CustomLabel.swift
//  UMates
//
//  Created by Austin Prince on 4/10/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import Foundation
import UIKit

class CustomLabel:UILabel {
    override func layoutSubviews() {
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.cornerRadius = 5
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        self.font = UIFont(name: "Avenir-Roman", size: 17)
        self.textColor = UIColor.red
    }
}

