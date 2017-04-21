//
//  LoginView.swift
//  UMates
//
//  Created by Austin Prince on 4/11/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginView: UIViewController {
    
    

    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var signOut: UIButton!
    @IBOutlet weak var loginOut: UIButton!
 
    
        
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var icon: UIView!
    
    @IBAction func signupButton(_ sender: UIButton) {
        
        guard let email = emailField.text else { return }
        
        guard let password = passwordField.text else { return }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if (error != nil) {
                print(error as Any)
                return
            }
            
            guard let uid = user?.uid else { return }
            let values = ["email": email]
            self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
            
            self.performSegue(withIdentifier: "signup", sender: sender)
        
            
        })
        
        
    }
    
    private func registerUserIntoDatabaseWithUID(uid: String, values: [String : AnyObject]) {
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("Users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err as Any)
                return
            }
            
            let user = User()
            user.setValuesForKeys(values)
        })
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        guard let email = emailField.text else { return }
        
        guard let password = passwordField.text else { return }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            print("About to Segue")
            self.performSegue(withIdentifier: "enter", sender: sender)
        })
        
        
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.icon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
        self.icon.backgroundColor = UIColor(red: 0.76, green: 0.0, blue: 0.0, alpha: 1.0)
        
        self.mainLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/4))
        self.signOut.backgroundColor = UIColor.gray
        self.loginOut.backgroundColor = UIColor.gray
        loginOut.layer.cornerRadius = 5
        signOut.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
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
