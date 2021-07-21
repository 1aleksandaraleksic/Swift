//
//  ViewController.swift
//  TestLayout
//
//  Created by aleksandar.aleksic on 5/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 15
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    

}

