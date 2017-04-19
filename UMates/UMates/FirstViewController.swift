//
//  FirstViewController.swift
//  UMates
//
//  Created by Taylor Ray Herald on 4/6/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = FakeData.getFeedViewData()
        table.delegate = self
        table.dataSource = self
        let barViewControllers = self.tabBarController?.viewControllers
        let person = FakeData.getPresentUserData()
        let svc = barViewControllers![2] as! SecondViewController
        svc.person = person
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connectView" {
            //let navVC = segue.destination as? UINavigationController
            let destinationViewController = segue.destination as! SecondViewController
            if let cell = sender as? UITableViewCell, let indexPath = table.indexPath(for: cell) {
                //                let destinationViewController = navVC?.viewControllers.first as! SecondViewController
                
                print ("\(people[indexPath.row])")
                let person = people[indexPath.row]
                destinationViewController.person = person
            }
            
            
            
        }
    }
    
    



}

