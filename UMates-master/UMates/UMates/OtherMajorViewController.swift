//
//  OtherMajorViewController.swift
//  UMates
//
//  Created by Brock Wade on 4/21/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit
import Firebase

class OtherMajorViewController: UIViewController {
    let otherMajorText : UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let addButton : UIButton = {
        let ab = UIButton()
        ab.translatesAutoresizingMaskIntoConstraints = false
        ab.backgroundColor = UIColor.blue
        ab.setTitle("Add", for: .normal)
        return ab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        otherMajorText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 24 ).isActive = true
        otherMajorText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        otherMajorText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        otherMajorText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addButton.centerXAnchor.constraint(equalTo: otherMajorText.centerXAnchor, constant: -50).isActive = true
        addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

