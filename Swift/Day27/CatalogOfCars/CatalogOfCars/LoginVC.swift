//
//  ViewController.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 5/30/21.
//

import UIKit

class LoginVC: UIViewController {
    
    var username: String = "aca"
    var password: String = "aca"

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if username == password{
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        DataPreparation.parseDataToModelCar(fileName: "model2", fileExtension: "csv")
        DataPreparation.manufacturerByName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if let username:String = usernameTextField.text, let password:String = passwordTextField.text{
            if username.count > 2 && password.count > 2{
                if username == password{
                    performSegue(withIdentifier: "loginSegue", sender: self)
                }else{
                    showAlert("Invalid username or password")
                }
            }else{
                showAlert("Invalid input min 3 character")
            }
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
    
}

