//
//  RoommatePreferencesViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/16/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RoommatePreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data = [Preference]()
    var pickerOptions = [String]()
    let toolBar = UIToolbar()
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePreferences))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data = FakeData.getPreferencesSetup()
        
        picker.delegate = self
        picker.dataSource = self
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pickerSave))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pickerSave))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
//        textField1.inputView = picker
//        textField1.inputAccessoryView = toolBar
    }
    
    func pickerSave() {
        print()
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
        cell.options.text = preference.getChoosenOption()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let preference = data[indexPath.row]
        pickerOptions.removeAll(keepingCapacity: false)
        pickerOptions = preference.getOptions()
        print(pickerOptions)
        picker.reloadAllComponents()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func savePreferences() {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        let preferences = FIRDatabase.database().reference().child("Users").child(uid).child("Preferences")
        let smoking = ""
        let drinking = ""
        let genderPref = ""
        let pet = ""
        let clean = ""
        let party = ""
        let cook = ""
        
        let values: [String: AnyObject] = ["smoking" : smoking as AnyObject, "drinking" : drinking as AnyObject, "genderPref" : genderPref as AnyObject, "pet" : pet as AnyObject, "clean" : clean as AnyObject, "party" : party as AnyObject, "cook" : cook as AnyObject]
        
    

    }

//    override func didReceveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
