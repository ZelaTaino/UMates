//
//  QuestionnaireMainViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/10/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class QuestionnaireMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var setProfileImageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var cameraBtn: UIButton!
    var questionnaireData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setProfileImageView.image = UIImage(named: "img/blurredImg.png")
        cameraBtn.setImage(UIImage(named: "img/cameraBtn.png"), for: .normal)
        questionnaireData = FakeData.getQuestionnaireMainData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3; // should i store this info else where
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionnaireMainTableViewCell
        cell.instructionTitle.text = questionnaireData[indexPath.row][0]
        cell.instructionDescript.text = questionnaireData[indexPath.row][1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "toAboutMe", sender: nil)
        case 1:
            performSegue(withIdentifier: "toPreferenceSetup", sender: nil)
        case 2:
            performSegue(withIdentifier: "toMoveInDetails", sender: nil)
        default:
            performSegue(withIdentifier: "", sender: nil)
        }
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
