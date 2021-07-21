//
//  ViewController.swift
//  SemaforSwitch
//
//  Created by aleksandar.aleksic on 5/24/21.
//

import UIKit

class RedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var mySwitch: UISwitch!
    
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        if mySwitch.isOn{
            performSegue(withIdentifier: "yellow", sender: nil)
        }
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        if mySwitch.isOn{
            performSegue(withIdentifier: "green", sender: nil)
        }
    }
}

