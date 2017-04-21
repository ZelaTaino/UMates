//
//  Preference.swift
//  UMates
//
//  Created by Glizela Taino on 4/16/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class Preference {
    private var iconImg: UIImage?
    private var title: String?
    private var choosenOption: String?
    private var options: [String]?
    
    init(iconImage: UIImage, title: String, choosenOption: String, options: [String]) {
        iconImg = iconImage
        self.title = title
        self.choosenOption = choosenOption
        self.options = options
    }
    
    init(title:String){
        self.title = nil
    }
    
    convenience init(){
        self.init(title: "")
    }
    
    func getIconImage() -> UIImage {
        return iconImg!
    }
    
    func getTitle() -> String {
        return self.title!
    }
    
    func getOptions() -> [String] {
        return options!
    }
    
    func getChoosenOption() -> String {
        return choosenOption!
    }
    
    func changeChoosenOption(newOption: String){
        self.choosenOption = newOption
    }
}
