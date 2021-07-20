//
//  Helper.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/29/21.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func prepareTabBarWithColor(backgroundColor: UIColor, fontColor: UIColor){
        if let tabBarC = tabBarController{
            tabBarC.tabBar.barTintColor = backgroundColor
            tabBarC.tabBar.tintColor = fontColor
        }
    }
    
    func showHideNavBar(isVisible: Bool){
        if let navBar = navigationController{
            navBar.navigationBar.isHidden = isVisible
        }
    }
    
    func showProfileVC(){
        let profileViewController = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC
        self.view.window?.rootViewController = profileViewController
        self.view.window?.makeKeyAndVisible()
    }
}

class Helper{
    
    
    
}
