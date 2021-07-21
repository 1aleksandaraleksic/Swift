//
//  ViewController.swift
//  ProjectSeven
//
//  Created by aleksandar.aleksic on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectImage.layer.cornerRadius = 0.5 * selectImage.bounds.size.width
        
        addRadiusOnEndgeTextField(nameInput)
        addRadiusOnEndgeTextField(surnameInput)
        addRadiusOnEndgeTextField(emailInput)
        addRadiusOnEndgeTextField(passwordInput)
        submitButton.layer.cornerRadius = 15
    }

    @IBOutlet var selectImage: UIImageView!
    
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var surnameInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var submitButton: UIButton!

    func addRadiusOnEndgeTextField(_ textField: UITextField){
        textField.layer.cornerRadius = 18
        textField.layer.masksToBounds = true
    }
}

