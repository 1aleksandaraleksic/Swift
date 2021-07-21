//
//  ViewController.swift
//  ProjectFive
//
//  Created by aleksandar.aleksic on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookButton.layer.cornerRadius = 20
        twitterButton.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
        
    }

    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    

}

