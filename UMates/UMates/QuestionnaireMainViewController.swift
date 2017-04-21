//
//  QuestionnaireMainViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/10/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class QuestionnaireMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var setProfileImageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var cameraBtn: UIButton!
    var questionnaireData = [[String]]()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setProfileImageView.image = UIImage(named: "img/blurredImg.png")
        cameraBtn.setImage(UIImage(named: "img/cameraBtn.png"), for: .normal)
        questionnaireData = FakeData.getQuestionnaireMainData()
        imagePicker.delegate = self
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
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {_ in self.openCamera()}))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {_ in self.openPhotoLibrary()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera(){
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Warning", message: "You don't have a camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openPhotoLibrary(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        setProfileImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func donePressed(_ sender: UIButton) {
        let _ = setProfileImageView.image
        print("Pass to db")
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
