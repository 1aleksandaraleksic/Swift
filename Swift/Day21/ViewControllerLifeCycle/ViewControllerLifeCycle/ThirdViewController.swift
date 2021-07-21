//
//  ThirdViewController.swift
//  ViewControllerLifeCycle
//
//  Created by aleksandar.aleksic on 5/25/21.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Third ViewController - View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Third ViewController - View Will Appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Third ViewController - View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Third ViewController - View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Third ViewController - View Did Appear")
    }

}
