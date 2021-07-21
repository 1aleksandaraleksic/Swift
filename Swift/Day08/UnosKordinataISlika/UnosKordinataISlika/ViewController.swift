//
//  ViewController.swift
//  UnosKordinataISlika
//
//  Created by aleksandar.aleksic on 5/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var xAxis: UITextField!
    @IBOutlet var yAxis: UITextField!
    
    @IBAction func move(_ sender: Any) {

        if let input = xAxis.text, let input2 = yAxis.text{
            if input.isEmpty && input2.isEmpty{
                generateAxis(input: input, axisName: "x")
                generateAxis(input: input2, axisName: "y")
            }else{
                showAlert(message: "input for x and y axis can't be empty")
            }
        }
        
    }
    
    func generateAxis(input: String, axisName:String){
        if let number = Int(input) {
            if axisName == "x" {
                imageView.frame.origin.x = CGFloat(number)
            } else{
                imageView.frame.origin.y = CGFloat(number)
            }
        }else{
            showAlert(message: "input for x and y axis must be a number")
        }
        

    }
    
    func showAlert (message: String){
        let alert = UIAlertController(title: "Something is wrong", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}

