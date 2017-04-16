//
//  RoommatePreferencesViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/16/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class RoommatePreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let data = [
        Preference(
            iconImage: UIImage(named: "img/smoking.png")!,
            title: "Smoke",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/drink.png")!,
            title: "Drink",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/gender.png")!,
            title: "Gender Preference",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/pet.png")!,
            title: "Pets",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/clean.png")!,
            title: "Cleaniness",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/party.png")!,
            title: "House Parties",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/cook.png")!,
            title: "Cooking Frequency",
            option: .set),
        Preference(
            iconImage: UIImage(named: "img/visitor.png")!,
            title: "Visitors",
            option: .set)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoommatePreferencesTableViewCell
        let preference = data[indexPath.row]
        cell.iconImg.image = preference.getIconImage()
        cell.preference.text = preference.getTitle()
        cell.options.text = preference.getOption()
        return cell
    }

    override func didReceveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
