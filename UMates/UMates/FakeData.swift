//
//  FakeData.swift
//  UMates
//
//  Created by Glizela Taino on 4/9/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

struct FakeData{
    
    static func getFeedViewData() -> [Person]{
        let people =  [
            Person(
                name: "George",
                major: "B.S. Computer Science",
                budget: "$700-$1000",
                moveInDate: "Aug 1",
                profileImg: UIImage(named: "img/george.jpg")!
            ),
            Person(
                name: "Paul",
                major: "B.F.A. Design",
                budget: "$8000-$1000000",
                moveInDate: "Aug 28",
                profileImg: UIImage(named: "img/paul.jpg")!
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
                profileImg: UIImage(named: "img/drake.jpg")!
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
    
    
}
