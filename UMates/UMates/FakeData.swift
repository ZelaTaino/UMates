//
//  FakeData.swift
//  UMates
//
//  Created by Glizela Taino on 4/9/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

struct FakeData{
    
    
    static func getPresentUserData() -> Person {
        let person = Person(name: "Austin", major: "B.S Computer Science", budget: "$800-$1200", moveInDate: "Aug 28", profileImg: UIImage(named: "img/austin.jpg")!, visitor: "Visitors", cook: 6, party: "Partier", clean: "Messy", pet: "No", drinking: "Occasional Drinker", smoking: "No", gender: "male", genderPref: "No Preference", gradYear: 2018, aboutMe: "I'm a pretty cool guy. Dual degree transfer student at Wash U so that's like pretty cool", interests: ["Chilling", "Hanging", "Gordon Ramsay", "Cooking"])
        return person
    }
    
    static func getFeedViewData() -> [Person]{
        let people =  [
            Person(
                name: "George",
                major: "B.S. Computer Science",
                budget: "$700-$1000",
                moveInDate: "Aug 1",
                profileImg: UIImage(named: "img/george.jpg")!,
                visitor: "No visitors",
                cook: 3,
                party: "Occasional Partier",
                clean: "Neat Freak",
                pet: "No",
                drinking: "Occasional Drinker",
                smoking: "No", gender: "male",
                genderPref: "same", gradYear: 2018,
                aboutMe: "I'm a member of the Beatles and I'm pretty chill, or so my band mates tell me! I like sing and play the guitar and stuff and have lots of fans.",
                interests:["Playing Guitar", "Being in the Beatles", "The Beatles", "Being a cool member of the Beatles"]
                
            ),
            Person(
                name: "Paul",
                major: "B.F.A. Design",
                budget: "$8000-$1000000",
                moveInDate: "Aug 28",
                profileImg: UIImage(named: "img/paul.jpg")!,
                visitor: "Visitors",
                cook: 6,
                party: "Party Alot",
                clean: "Messy",
                pet: "Yes",
                drinking: "Heavy Drinker",
                smoking: "Yes",
                gender: "male",
                genderPref: "same",
                gradYear: 1964,
                aboutMe: "I'm also in the Beatles. People say I'm much cooler than George which I would have to agree with. I'm like the best member according to me. And oh yea, I'm in the Beatles",
                interests:["The Beatles", "Hanging with Kanye and Rihanna", "Making songs", "Being a rockstar"]
            ),
            Person(
                name: "John",
                major: "B.S. Music",
                budget: "$2000-$30000",
                moveInDate: "Aug 30",
                profileImg: UIImage(named: "img/john.jpg")!
            ),
            Person(
                name: "Ringo",
                major: "B.S. Mechanical Engineering",
                budget: "$600-$1000",
                moveInDate: "Aug 20",
                profileImg: UIImage(named: "img/ringo.jpg")!
            ),
            Person(
                name: "Harry",
                major: "Premed",
                budget: "$1000-$5000",
                moveInDate: "Aug 29",
                profileImg: UIImage(named: "img/harry.jpg")!
            )
        ]
        return people
    }
    
    static func getConnectionsViewData() -> [Person]{
        let people =  [
            Person(
                name: "Drake",
                major: "B.A. Music",
                budget: "$7000-$10000",
                moveInDate: "Aug 1",
                profileImg: UIImage(named: "img/drake.jpg")!,
                visitor: "No visitors",
                cook: 3,
                party: "Occasional Partier",
                clean: "Neat Freak",
                pet: "No",
                drinking: "Occasional Drinker",
                smoking: "No",
                gender: "male",
                genderPref: "same",
                gradYear: 2018,
                aboutMe: "I'm a member of the Beatles and I'm pretty chill, or so my band mates tell me! I like sing and play the guitar and stuff and have lots of fans.",
                interests:["Being Drake", "Crying", "Male Sensitivity", "Rapping hella hard"]
            ),
            Person(
                name: "Kanye",
                major: "B.F.A. Design",
                budget: "$10000-$1000000",
                moveInDate: "Aug 28",
                profileImg: UIImage(named: "img/kanye.jpg")!
            ),
            Person(
                name: "Zayne",
                major: "B.A. Music",
                budget: "$30000-$50000",
                moveInDate: "Aug 30",
                profileImg: UIImage(named: "img/zayne.jpg")!
            ),
            Person(
                name: "Austin",
                major: "B.S. Computer Science",
                budget: "$600-$900",
                moveInDate: "Aug 20",
                profileImg: UIImage(named: "img/austin.jpg")!
            ),
            Person(
                name: "Izzy",
                major: "B.S. Mechanical Engineering",
                budget: "$1000-$5000",
                moveInDate: "Aug 29",
                profileImg: UIImage(named: "img/izzy.jpg")!
            )
        ]
        return people
    }
    
    static func getQuestionnaireMainData() -> [[String]]{
        let q = [["Set about me", "Summarize who you are as a human"], ["Set roommate preferences", "Let others know who you are as a roommate"], ["Move in details", "Let others know your roommate details"]]
        return q
    }
    
    static func getPreferencesSetup() -> [Preference] {
        let data = [
            Preference(
                iconImage: UIImage(named: "img/Smoking-50.png")!,
                title: "Smoke",
                choosenOption: "Set",
                options: ["No", "Yes", "No Preference"]),
            Preference(
                iconImage: UIImage(named: "img/drink.png")!,
                title: "Drink",
                choosenOption: "Set",
                options: ["No", "Occassionally", "Yes"]),
            Preference(
                iconImage: UIImage(named: "img/gender.png")!,
                title: "Gender Preference",
                choosenOption: "Set",
                options: ["Male", "Female", "No Preference"]),
            Preference(
                iconImage: UIImage(named: "img/pet.png")!,
                title: "Pets",
                choosenOption: "Set",
                options: ["No", "Yes", "No preference"]),
            Preference(
                iconImage: UIImage(named: "img/clean.png")!,
                title: "Cleaniness",
                choosenOption: "Set",
                options: ["Neat Freak", "Clean Shared Space", "Messy"]),
            Preference(
                iconImage: UIImage(named: "img/party.png")!,
                title: "House Parties",
                choosenOption: "Set",
                options: ["No", "Occassionally", "Yes"]),
            Preference(
                iconImage: UIImage(named: "img/cook.png")!,
                title: "Cooking Frequency",
                choosenOption: "Set",
                options: ["Never", "Occasionally", "Everyday"]),
            Preference(
                iconImage: UIImage(named: "img/visitor.png")!,
                title: "Visitors",
                choosenOption: "Set",
                options: ["Never", "Occasionally", "Everyday"])
        ]
        
        return data
    }
    
    
}
