//
//  Person.swift
//  UMates
//
//  Created by Glizela Taino on 4/6/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class Person{
    private var name: String?
    private var major: String?
    private var budget: String?
    private var moveInDate: String?
    private var profileImg: UIImage
    
    init(name: String, major: String, budget: String, moveInDate: String, profileImg: UIImage) {
        self.name = name
        self.major = major
        self.budget = budget
        self.moveInDate = moveInDate
        self.profileImg = profileImg
    }
    
    func getName() -> String {
        return name!
    }
    
    func getMajor() -> String{
        return major!
    }
    
    func getBudget() -> String{
        return budget!
    }
    
    func getMoveInDate() -> String {
        return moveInDate!
    }
    
    func getProfileImage() -> UIImage{
        return profileImg
    }
}
