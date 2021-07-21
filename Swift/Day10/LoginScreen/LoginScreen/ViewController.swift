//
//  ViewController.swift
//  LoginScreen
//
//  Created by aleksandar.aleksic on 5/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 15
        signInButton.layer.cornerRadius = 15
//        companyImage.layer.cornerRadius = 20
    }

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var companyImage: UIImageView!
    
    
    
}

