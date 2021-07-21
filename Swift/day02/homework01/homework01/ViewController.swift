//
//  ViewController.swift
//  homework01
//
//  Created by aleksandar.aleksic on 4/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet var textFieldInput: UITextField!
    @IBOutlet var labelResult: UILabel!
    
    @IBAction func checkPalindrome(_ sender: Any) {
        
        let word: String = textFieldInput.text!
        let reversedWord: String = String(word.reversed())
        
        if word.isEmpty {
            labelResult.text = "Molimo unesite rec"
            labelResult.backgroundColor = .gray
        } else if word == reversedWord {
            labelResult.text = "Uneta rec je palindrom \n \(word) -> \(reversedWord)"
            labelResult.backgroundColor = .green
        } else{
            labelResult.text = "Uneti tekst NIJE palindrom \n \(word) -> \(reversedWord)"
            labelResult.backgroundColor = .red
        }
        textFieldInput.text = ""
    }
    
}

