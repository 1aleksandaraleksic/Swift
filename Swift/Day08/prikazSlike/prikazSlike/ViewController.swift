//
//  ViewController.swift
//  prikazSlike
//
//  Created by aleksandar.aleksic on 5/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var prikazSlike: UIImageView!
    
    @IBAction func gore(_ sender: Any) {
        prikazSlike.frame.origin.y -= 5
    }
    
    @IBAction func dole(_ sender: Any) {
        prikazSlike.frame.origin.y += 5
    }
    
    @IBAction func levo(_ sender: Any) {
        prikazSlike.frame.origin.x -= 5
    }
    
    @IBAction func desno(_ sender: Any) {
        prikazSlike.frame.origin.x += 5
    }
    
}

