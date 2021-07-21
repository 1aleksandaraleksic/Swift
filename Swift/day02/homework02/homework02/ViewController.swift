//
//  ViewController.swift
//  homework02
//
//  Created by aleksandar.aleksic on 4/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    var myArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var textFieldInput: UITextField!
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var listOfCorrectAttempt: UILabel!
    
    @IBAction func checkPalindrome(_ sender: Any) {
        
        let sentence: String = textFieldInput.text!
        let reversedSentece = String(sentence.reversed())
        
        var prepereSentence: String = sentence
        
        let chars: Set<Character> = [" ", ".", ","]
        
        prepereSentence.removeAll(where: {chars.contains($0)})
        
//        prepereSentence.replacingOccurrences(of: ".", with: "")
        
        let prepereSentenceReversed = String(prepereSentence.reversed())
        print("\(prepereSentence)")
        if sentence.isEmpty{
            labelResult.text = "Molimo Vas unesite recenicu za proveru"
            labelResult.backgroundColor = .yellow
        }else if prepereSentence.lowercased() == prepereSentenceReversed.lowercased() {
            labelResult.text = "Bingo, ova recenica je palindrom \n \(sentence) : \(reversedSentece)"
            labelResult.backgroundColor = .green
            myArray.append(sentence)
            listOfCorrectAttempt.text = myArray.description
        }else {
            labelResult.text = "Greska, ovo nije palindrom"
            labelResult.backgroundColor = .red
        }
        
    }
    

}

