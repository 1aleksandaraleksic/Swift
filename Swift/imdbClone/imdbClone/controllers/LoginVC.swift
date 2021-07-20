//
//  LoginVC.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/28/21.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth

class LoginVC: UIViewController, GIDSignInDelegate {
    
    let db = Firestore.firestore()
    
    @IBOutlet var googleSignUp: UIButton!
    @IBOutlet var imdbSignUp: UIButton!
    @IBOutlet var hyperLinkConditions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.delegate = self
        
        showHideNavBar(isVisible: true)
        googleSignUp.imageEdgeInsets = UIEdgeInsets(top: 4, left: 3, bottom: 4, right: (googleSignUp.frame.width - 130))
        imdbSignUp.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: (googleSignUp.frame.width - 130))
        
    }
    
    
    @IBAction func googleSignin(_ sender: Any) {
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
              print("The user has not signed in before or they have since signed out.")
            } else {
              print("\(error.localizedDescription)")
            }
            return
        }
        
        guard let authentication = user.authentication else { return }
          let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        self.createUser(credential, user.profile.name, user.userID)
        db.collection("Users").whereField("uid", isEqualTo: String(user.userID)).getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil{
                self.showProfileVC()
            }else{
                self.createUser(credential, user.profile.name, user.userID)
            }
        }
    }

    func createUser(_ credential: AuthCredential, _ fullName: String, _ uid: String){
        Auth.auth().signIn(with: credential){(authResult, error) in
            if error != nil{
                //Couldn't sign in
                self.showAlert("ERROR: with Auth.")
            }else{
                self.db.collection("Users")
                  .addDocument(data: [
                    "fullName": fullName,
                    "uid" : uid
                ]) { (error) in
                    if error != nil{
                        //Show error message
                        print("Error saving user data")
                    }
                }
                self.showProfileVC()
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logIn-signUpVC"{
            let vc = segue.destination as! SignUpVC
            vc.title = "Test"
            
        }
    }
}
