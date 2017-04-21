//
//  AboutMeViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/13/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AboutMeViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
//    var person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        setTextField()
        textView.textColor = UIColor.lightGray
        textView.becomeFirstResponder()
        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText = textView.text as NSString?
        let updatedText = currentText?.replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if (updatedText?.isEmpty)! {
            
            textView.text = "Describe who you are as a human"
            textView.textColor = UIColor.lightGray
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            
            return false
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, clear
            // the text view and set its color to black to prepare for
            // the user's entry
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }

    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        let ref = FIRDatabase.database().reference().child("Users")

        _ = navigationController?.popViewController(animated: true)
        guard let aboutMe = textView.text else { return }
        let childRef = ref.child((FIRAuth.auth()?.currentUser!.uid)!)
        let values : [String : AnyObject] = ["aboutMe" : aboutMe as AnyObject]
        childRef.updateChildValues(values)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTextField() {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        FIRDatabase.database().reference().child("Users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                if let theText = dictionary["aboutMe"] {
                    self.textView.text = theText as? String
                }
                else {
                    self.textView.text = "Describe who you are as a human"

                }
            }
            else {
                self.textView.text = "Describe who you are as a human"
                
            }
        })
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
