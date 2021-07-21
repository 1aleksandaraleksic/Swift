//
//  ViewController.swift
//  Day04
//
//  Created by aleksandar.aleksic on 4/27/21.
//

import UIKit

class ViewController: UIViewController {

//    var justANumber: [Int] = []
    var totalSum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var input: UITextField!
    @IBOutlet var showResult: UILabel!
    
    @IBAction func onClick(_ sender: Any) {
        let inputString: String = input.text!
        
        for c in inputString{
            if let number = Int(String(c)){
//                justANumber.append(number)
                totalSum += number
            }
        }
        
//        for num in justANumber{
//            totalSum += num
//        }
        showResult.text = String(totalSum)
    }
    
}

