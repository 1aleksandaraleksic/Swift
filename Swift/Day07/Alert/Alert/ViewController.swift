//
//  ViewController.swift
//  Alert
//
//  Created by aleksandar.aleksic on 5/5/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var text1: UITextField!
    @IBOutlet var text2: UITextField!
    
    
    
    @IBAction func alert(_ sender: Any) {
        showAlert()
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: text1.text, message: text2.text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alert, animated: true)
    }
    
}

