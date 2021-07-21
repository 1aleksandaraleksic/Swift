//
//  ViewController.swift
//  LoginTransition
//
//  Created by aleksandar.aleksic on 5/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var repeatPassword: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
    }

    @IBAction func repeatChanged(_ sender: Any) {
        loginButton.isEnabled = true
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let passValue = password.text?.description
        let repeatPassValue = repeatPassword.text?.description
        if userName.text!.count > 3 {
            if passValue == repeatPassValue{
                performSegue(withIdentifier: "login", sender: nil)
            }else{
                showAlert("Bouth password not matched")
            }
        }else{
            showAlert("Username has minimum 4 character")
        }
    }
    
    @IBAction func forgotUserNameAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotUserName", sender: nil)
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotPassword", sender: nil)
    }
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "Something whent wrong", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

