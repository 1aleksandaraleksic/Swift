//
//  ViewController.swift
//  Day04_03
//
//  Created by aleksandar.aleksic on 4/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var inputText: UITextField!
    
    @IBAction func onClick(_ sender: Any) {
        let changedText = changeFirstAndLastNumberInString(array: Array(inputText.text!))
        
        if isEmpty(length: changedText!.count) {
            inputText.text = changedText
        }
        
    }
    
    func isEmpty(length:Int) -> Bool{
        if length == 0{
            inputText.layer.borderWidth = 2
            inputText.layer.borderColor = UIColor.red.cgColor
            return false
        }else {
            inputText.layer.borderWidth = 0
            return true
        }
    }
    
    func changeFirstAndLastNumberInString(array: [Character]) -> String? {
        var arrayInputString: [Character] = array
        var countJ = 0
        
        for (i, char) in arrayInputString.enumerated(){
            if char.isNumber{
                for j in stride (from: arrayInputString.count - 1 - countJ, to: i, by: -1){
                    countJ += 1
                    if arrayInputString[j].isNumber{
                        let temp = arrayInputString[i]
                        arrayInputString[i] = arrayInputString[j]
                        arrayInputString[j] = temp
                        break
                    }
                }
            }
        }
        return String(arrayInputString)
    }
}

