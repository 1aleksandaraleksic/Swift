//
//  ViewController.swift
//  ProjectEight
//
//  Created by aleksandar.aleksic on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addRadiusOnEndgeTextField(phoneModelInput)
        addRadiusOnEndgeTextField(quanityInput)
        addRadiusOnEndgeTextField(nameSurnameInput)
        addRadiusOnEndgeTextField(cityNameInput)
        addRadiusOnEndgeTextField(cityCodeInput)
        
        submitButton.layer.cornerRadius = 15
    }

    @IBOutlet var phoneModelInput: UITextField!
    @IBOutlet var quanityInput: UITextField!
    @IBOutlet var nameSurnameInput: UITextField!
    @IBOutlet var cityNameInput: UITextField!
    @IBOutlet var cityCodeInput: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    
    
    func addRadiusOnEndgeTextField(_ textField: UITextField){
        textField.layer.cornerRadius = 18
        textField.layer.masksToBounds = true
    }
}

