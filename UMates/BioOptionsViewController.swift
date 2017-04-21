//
//  BioOptionsViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/20/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class BioOptionsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.gray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(dismissKeyboard))
        doneButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Avenir-Roman", size: 15.0)!], for: .normal)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0.25)
        let border = UIView(frame: frame)
        border.backgroundColor = UIColor.groupTableViewBackground
        toolBar.addSubview(border)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        name.inputAccessoryView = toolBar


        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard(){
        name.endEditing(true)
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
