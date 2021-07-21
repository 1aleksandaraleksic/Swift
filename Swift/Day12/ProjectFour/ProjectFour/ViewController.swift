//
//  ViewController.swift
//  ProjectFour
//
//  Created by aleksandar.aleksic on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.layer.cornerRadius = 20
        facebookButton.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
        
//        let bottomBorder = CALayer()
//        bottomBorder.frame = CGRect(x: 0, y: self.usernameField.frame.size.height - 2.0, width: self.usernameField.frame.size.width - 100.0, height: 1.0)
//        bottomBorder.borderWidth = 1
//        bottomBorder.borderColor = UIColor.white.cgColor
//
//        usernameField.layer.addSublayer(bottomBorder)
        
        usernameField.layer.borderWidth = 0
        passwordField.layer.borderWidth = 0
        
    }


    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    
}

