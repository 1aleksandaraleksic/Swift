//
//  ViewController.swift
//  ProjectTwo
//
//  Created by aleksandar.aleksic on 5/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 15

        assignAShadowToElement(button)
        assignAShadowToElement(logoImage)
        assignAShadowToElement(inputEmail)
        assignAShadowToElement(inputPassword)

    }

    @IBOutlet var button: UIButton!
   
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var inputEmail: UITextField!
    @IBOutlet var inputPassword: UITextField!
    

    func assignAShadowToElement(_ uiElement: AnyObject){
        uiElement.layer.shadowColor = UIColor.black.cgColor
        uiElement.layer.shadowOpacity = 0.8
        uiElement.layer.shadowOffset = .zero
        uiElement.layer.shadowRadius = 5
    }
}

