//
//  Preference.swift
//  UMates
//
//  Created by Glizela Taino on 4/16/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class Preference {
    private var iconImg: UIImage
    private var title: String
    private var option: Option
    
    enum Option {
        case set
        case yes
        case no
        case male
        case female
        case noPreference
        case occasionally
        case allergic
        case neatFreak
        case cleanSharedSpace
        case messy
        case never
        case everyday
        case often
    }
    
    init(iconImage: UIImage, title: String, option: Option) {
        iconImg = iconImage
        self.title = title
        self.option = option
    }
    
    func getIconImage() -> UIImage {
        return iconImg
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getOption() -> Option {
        return self.option
    }
}
