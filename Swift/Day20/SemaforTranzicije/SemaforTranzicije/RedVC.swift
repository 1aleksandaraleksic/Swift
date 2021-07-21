//
//  ViewController.swift
//  SemaforTranzicije
//
//  Created by aleksandar.aleksic on 5/24/21.
//

import UIKit

class RedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBOutlet var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
    }
  
}

