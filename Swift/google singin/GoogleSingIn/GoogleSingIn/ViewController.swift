//
//  ViewController.swift
//  GoogleSingIn
//
//  Created by aleksandar.aleksic on 6/23/21.
//

import UIKit
import GoogleSignIn
 
class ViewController: UIViewController, GIDSignInDelegate {
    
    @IBAction func googleSignin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func googleSignOut(_ sender: Any) {
        print(GIDSignIn.sharedInstance()?.currentUser != nil) // true - signed in
        print(GIDSignIn.sharedInstance()?.currentUser.authentication.accessToken, "Ovo je accessToken")
        print(GIDSignIn.sharedInstance()?.currentUser, "Ovo je aktivni user")
        GIDSignIn.sharedInstance()?.disconnect()
        GIDSignIn.sharedInstance()?.signOut()
        

    }
      
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print(GIDSignIn.sharedInstance()?.currentUser, " Ovo je user")
        print(GIDSignIn.sharedInstance()?.currentUser != nil)
       
        print("User disconectect")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
      let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
      let givenName = user.profile.givenName
      let familyName = user.profile.familyName
      let email = user.profile.email
      // ...
        print(userId, idToken, fullName, email, givenName, familyName)
    }
    
}

