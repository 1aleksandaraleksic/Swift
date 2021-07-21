//
//  ViewController.swift
//  CircleImage
//
//  Created by aleksandar.aleksic on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleImage.layer.cornerRadius = circleImage.frame.width / 2
        circleImage.layer.masksToBounds = true
    }

    @IBOutlet var circleImage: UIImageView!
    @IBOutlet var button: UIButton!
    
}

