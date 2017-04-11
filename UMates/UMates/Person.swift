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
    private var visitor:String?
    private var cook:Int?
    private var party:String?
    private var clean:String?
    private var pet:String?
    private var drinking:String?
    private var smoking:String?
    private var genderPref:String?
    private var gender:String?
    private var gradYear:Int?
    private var aboutMe:String?
    private var interests:[String]?

    
 
    
    init(name: String, major: String, budget: String, moveInDate: String, profileImg: UIImage) {
        self.name = name
        self.major = major
        self.budget = budget
        self.moveInDate = moveInDate
        self.profileImg = profileImg
    }
    init (name: String, major: String, budget: String, moveInDate: String, profileImg: UIImage, visitor: String, cook: Int, party: String, clean: String, pet: String, drinking: String, smoking: String, gender: String, genderPref: String, gradYear: Int, aboutMe: String, interests: [String]) {
        self.name = name
        self.major = major
        self.budget = budget
        self.moveInDate = moveInDate
        self.profileImg = profileImg
        self.visitor = visitor
        self.cook = cook
        self.party = party
        self.clean = clean
        self.pet = pet
        self.drinking = drinking
        self.smoking = smoking
        self.gender = gender
        self.genderPref = genderPref
        self.gradYear = gradYear
        self.aboutMe = aboutMe
        self.interests = interests
        
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
    func getVisitor() -> String {
        return visitor!
    }
    func getCook() -> Int {
        return cook!
    }
    func getParty() -> String {
        return party!
    }
    func getClean() -> String {
        return clean!
    }
    func getPet() -> String {
        return pet!
    }
    func getDrink() -> String {
        return drinking!
    }
    func getSmoking() -> String {
        return smoking!
    }
    func getGender() -> String {
        if (genderPref! == "Same" && gender! == "female") {
            return "Female Preferred"
        }
        else if (genderPref! == "Same" && gender! == "male") {
            return "Male Preferred"
        }
        else {
            return "No Preference"
        }
    }
    func getGradYear() -> Int  {
        return gradYear!
    }
    func getAbout() -> String {
        return aboutMe!
    }
    func getInterests() -> [String] {
        return interests!
    }
    
    
}
