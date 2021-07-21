//
//  ViewController.swift
//  Semafor
//
//  Created by aleksandar.aleksic on 4/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentLight: Int = 1
    var goUpOrDown: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        switchColor()
    }
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBAction func onClick(_ sender: Any) {
        switchColor()
        changeStateOfLight()
    }
    
    
    func switchColor(){
        if currentLight == 1{
            redLight.backgroundColor = .red
            if !goUpOrDown {
                yellowLight.backgroundColor = .white
            }
        }else if currentLight == 2{
            yellowLight.backgroundColor = .yellow
            if !goUpOrDown {
                greenLight.backgroundColor = .white
            }
        }else{
            redLight.backgroundColor = .white
            yellowLight.backgroundColor = .white
            greenLight.backgroundColor = .green
        }
    }
    
    func changeStateOfLight(){
        if currentLight == 1{
            currentLight += 1
            goUpOrDown = true
        }else if currentLight == 2{
            if goUpOrDown {
                currentLight += 1
            }else{
                currentLight -= 1
            }
        }else {
            currentLight -= 1
            goUpOrDown = false
        }
    }

}

