//
//  ViewController.swift
//  demo05
//
//  Created by aleksandar.aleksic on 4/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var num1: UITextField!
    @IBOutlet var num2: UITextField!
    @IBOutlet var result: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        let number1: Int? = Int(num1.text!)
        let number2: Int? = Int(num2.text!)
        
        if number1 != nil && number2 != nil{
            let sum: Int = number1! + number2!
            result.text = "Rezultat \(sum)"
        }else{
            result.text = "Nije moguce izracunati"
        }
    }
    
}

