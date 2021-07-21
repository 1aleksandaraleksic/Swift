//
//  ViewController.swift
//  ProjectThree
//
//  Created by aleksandar.aleksic on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.layer.cornerRadius = 30
        
        signUpButton.layer.cornerRadius = 20
        signInButton.layer.cornerRadius = 20
    }


    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
}

