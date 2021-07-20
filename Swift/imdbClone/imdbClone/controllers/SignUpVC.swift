//
//  SignUpVC.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/29/21.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passworShowHideButton: CheckBoxButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showHidePass(_ sender: Any) {
        if passworShowHideButton.isSelected{
            passwordTextField.isSecureTextEntry = true
        }else{
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.showAlert("Error creating user.")
            }else{
                let db = Firestore.firestore()
                db.collection("Users").addDocument(data: [
                    "fullName" : name,
                    "email": email,
                    "uid": result!.user.uid
                ]){ (error) in
                    if error != nil{
                        self.showAlert("Error saving user data")
                    }
                }
                self.showProfileVC()
            }
        }
    }
    
}
