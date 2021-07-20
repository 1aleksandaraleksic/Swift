//
//  LoginFormVC.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/29/21.
//

import UIKit
import Firebase

class LoginFormVC: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var buttonShowPassword: CheckBoxButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideNavBar(isVisible: false)
        setImageToNavBar()
    }
    
    
    @IBAction func showHidePassword(_ sender: Any) {
        if buttonShowPassword.isSelected{
            passwordTextField.isSecureTextEntry = true
        }else{
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.showAlert("Email or password incorect")
            }else{
                let profileVC = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC
                self.view.window?.rootViewController = profileVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    func setImageToNavBar(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 10))
        imageView.contentMode = .scaleAspectFit
        imageView.image =  UIImage(named: "imdb-landscape")
        self.navigationItem.titleView = imageView
    }
    
}
