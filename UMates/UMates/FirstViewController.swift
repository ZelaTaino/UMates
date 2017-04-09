//
//  FirstViewController.swift
//  UMates
//
//  Created by Taylor Ray Herald on 4/6/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people =  [
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
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        let aPerson = people[indexPath.row]
        cell.setName(name: aPerson.getName())
        cell.setMajor(major: aPerson.getMajor())
        cell.setBudget(budget: aPerson.getBudget())
        cell.setMoveInDate(moveInDate: aPerson.getMoveInDate())
        cell.setProfileImage(image: aPerson.getProfileImage())
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

