//
//  MajorSearchViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/10/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import Firebase
import UIKit

class MajorSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var table: UITableView!
//    let person = Person()
    let majors = ["Computer Science", "Business", "Economics", "Design", "Mechanical Engineering", "Finance", "Biomedical Engineering"]
    
    var loginController: LoginView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Other", style: .plain, target: self, action: #selector(addOtherMajor))
        
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func addOtherMajor() {
        let newMajor = OtherMajorViewController()
        let navController = UINavigationController(rootViewController: newMajor)
        present(navController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return majors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        cell.majorTitle.text = majors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SearchTableViewCell
        let cellTitle = cell.majorTitle.text
//        person.setMajor(cellTitle)
        _ = navigationController?.popViewController(animated: true)
        print("\(cell.majorTitle.text!)")
    }

    override func didReceiveMemoryWarning() {
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
