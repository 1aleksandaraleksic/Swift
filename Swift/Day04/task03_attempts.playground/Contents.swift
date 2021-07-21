//
//  ViewController.swift
//  Day04_03
//
//  Created by aleksandar.aleksic on 4/27/21.
//

import UIKit

class ViewController: UIViewController {

    var targetString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var inputText: UITextField!
    
    @IBAction func onClick(_ sender: Any) {
        
        var arrayInputString = Array(inputText.text!)
        var countI = 0
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
            countI += 1
        }
        
        inputText.text = String(arrayInputString)
        targetString = ""
        
//        for i in stride (from: 0, to: arrayInputString.count, by: 1){
//            if arrayInputString[i].isNumber{
//                for j in stride (from: arrayInputString.count - 1 - countJ, to: i, by: -1){
//                    countJ += 1
//                    if arrayInputString[j].isNumber{
//                        let temp = arrayInputString[i]
//                        arrayInputString[i] = arrayInputString[j]
//                        arrayInputString[j] = temp
//                        break
//                    }
//                }
//            }
//            countI += 1
//        }

        
//        for _ in stride (from: 2, to: 0, by: -1){
//            countJ -= 1
//            print(arrayInputString[inputString.count-1-countJ],"kkk")
//
//            if arrayInputString[countJ].isNumber{
//                arrayInputString[countI] = arrayInputString[inputString.count-1-countJ]
//                arrayInputString[inputString.count-1-countJ] = arrayInputString[countI]
//
//                if !arrayInputString[countJ - 1].isNumber{ break}
//            }
//
//        }
        
        
//        print(targetString)
        
        //                for charRev in inputString.reversed(){
        //                    if charRev.isNumber{
        //                        temNumber += String(char)
        //                        targetString += String(charRev)
        //                        print("if charRev ", charRev)
        //                        countJ += 1
        //                        break;
        //                    }
        //                }
        //                countJ = 0
        
        //                for s in stride (from: inputString.count, through:  inputString.count - count, by: -1){
        //                    print(s)
        //                }
        
//        var tempNumber1: String = ""
//        var tempNumber2: String = ""
//        var copyFrom: Int = 0
//        var copyTo: Int = 0
//
//        for (i, num1) in inputString.enumerated() {
//            if tempNumber1.count > 1 && !num1.isNumber{
//                copyFrom = i
//                break;
//            }
//
//            if let number = num1.wholeNumberValue{
//                tempNumber1 += String(number)
//            }else{
//                targetString += String(num1)
//            }
//        }
//
//        for (i, num2) in inputString.reversed().enumerated() {
//            if let number = num2.wholeNumberValue{
//                tempNumber2 += String(number)
//            }
//            if tempNumber2.count > 1 && !num2.isNumber{
//                copyTo = inputString.count - i
//                break;
//            }
//        }
//
//        targetString += tempNumber2.reversed()
//
//        for s in stride(from: copyFrom, to: copyTo, by: 1){
//            let char = inputString[inputString.index(inputString.startIndex, offsetBy: s)]
//            targetString += String(char)
//        }
//
//        targetString += tempNumber1
//
//        for s in stride(from:copyTo, to: inputString.count, by: 1){
//            let char = inputString[inputString.index(inputString.startIndex, offsetBy: s)]
//            if !char.isNumber{
//                targetString += String(char)
//            }
//        }
        
        
    }
    
    
}


