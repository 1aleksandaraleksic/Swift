//
//  ViewController.swift
//  demo02
//
//  Created by aleksandar.aleksic on 4/22/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var test: String = "probaaa"
    
    @IBOutlet var mojaLabela: UILabel!
    
    @IBOutlet var mojTextFild: UITextField!

    @IBOutlet var label2: UILabel!
    
    @IBAction func klik(_ sender: Any) {
        mojaLabela.text = mojTextFild.text
        
        let str: String = mojTextFild.text!
        
        let reversed = String(str.reversed())
        label2.text = reversed
    }
    

    
}

