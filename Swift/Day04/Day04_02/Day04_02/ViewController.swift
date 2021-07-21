//
//  ViewController.swift
//  Day04_02
//
//  Created by aleksandar.aleksic on 4/27/21.
//

import UIKit

class ViewController: UIViewController {

    var totalSum: Int = 0
    var array: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBOutlet var input: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func click(_ sender: Any) {
        let inputString: String = input.text!
        
        var tempNumber: String = ""
        
        for num in inputString{
            if let number = Int(String(num)){
                tempNumber += String(number)
            }else{
                if let word = Int(tempNumber){
                    array.append(word)
                }
                tempNumber = ""
            }
        }
        
        if let word = Int(tempNumber){
            array.append(word)
        }
        
        for num in array{
            totalSum += num
        }
        
        resultLabel.text = "\(totalSum)"
        totalSum = 0
        array = []
    }
}

