//
//  ViewController.swift
//  DinamicCreateObject5Constraint
//
//  Created by aleksandar.aleksic on 6/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var pinkView: UIView!
    @IBOutlet var pinkTopContstraint: NSLayoutConstraint!
    
    @IBAction func promeniC(_ sender: Any) {
        pinkTopContstraint.constant = 300
    }
    
    @IBAction func kreirajC(_ sender: Any) {
        view.removeConstraint(pinkTopContstraint)
    
    
        let const = NSLayoutConstraint(item: pinkView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 50)
        view.addConstraint(const)
        
    }
}

