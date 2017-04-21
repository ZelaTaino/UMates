//
//  RoommatePreferencesViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/16/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class RoommatePreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data = [Preference]()
    var pickerOptions = [String]()
    let toolBar = UIToolbar()
    var picker = UIPickerView()
    var per = Preference()
    var container = UIView()

    @IBOutlet weak var savePressed: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        data = FakeData.getPreferencesSetup()
        
        toolBar.frame.origin = CGPoint(x: 0, y: 0)
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.gray
        toolBar.sizeToFit()
        
        var frame = CGRect(x: 0, y: toolBar.frame.height, width: self.view.frame.width, height: 256.0)
        picker = UIPickerView(frame: frame)
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor(colorLiteralRed: 231/255, green: 231/255, blue: 236/255, alpha: 1)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pickDonePressed))
        doneButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Avenir-Roman", size: 15.0)!], for: .normal)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0.25)
        let border = UIView(frame: frame)
        border.backgroundColor = UIColor.groupTableViewBackground
        toolBar.addSubview(border)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        picker.addSubview(toolBar)
        
        let contianerHeight = picker.frame.height + toolBar.frame.height + border.frame.height
        print(contianerHeight)
        frame = CGRect(x: 0, y: self.view.frame.height - contianerHeight, width: self.view.frame.width, height: contianerHeight)
        container = UIView(frame: frame)
        container.backgroundColor = UIColor.clear
        container.addSubview(toolBar)
        container.addSubview(picker)
        self.view.addSubview(container)
        
        container.isHidden = true
    
    }
    
    func pickDonePressed() {
        container.isHidden = true
        pickerIsShowing(bool: false, indexPath: [0, 0])
    }
    
    func pickerIsShowing(bool: Bool, indexPath: IndexPath){
        if bool{
            let containterSize = container.frame.size
            var contentInsets: UIEdgeInsets
            contentInsets = UIEdgeInsetsMake(0, 0, containterSize.height, 0)
            tableView.contentInset = contentInsets
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            tableView.scrollIndicatorInsets = tableView.contentInset
            
        }else{
            let contentInsets = UIEdgeInsets.zero
            tableView.contentInset = contentInsets
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            tableView.scrollIndicatorInsets = tableView.contentInset
        }
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
        cell.options.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        container.isHidden = false
        pickerIsShowing(bool: true, indexPath: indexPath)
        picker.selectRow(0, inComponent: 0, animated: true)
        
        let preference = data[indexPath.row]
        per = preference
        pickerOptions.removeAll(keepingCapacity: false)
        pickerOptions = preference.getOptions()
        picker.reloadAllComponents()
        
        pickerHasChanged(row: 0)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(pickerOptions[row])
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerHasChanged(row: row)
    }
    
    func pickerHasChanged(row: Int){
        per.changeChoosenOption(newOption: pickerOptions[row])
        tableView.reloadData()
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
        print("Pass updated data to db")
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
