//
//  ViewController.swift
//  demo04
//
//  Created by aleksandar.aleksic on 4/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var labela: UILabel!
    @IBOutlet var ime: UITextField!
    @IBOutlet var prezime: UITextField!
    @IBOutlet var srIme: UITextField!
    
    @IBAction func prikazi(_ sender: Any) {
        labela.text = ime.text! + " " + srIme.text! + " " + prezime.text!
    }
    
}

