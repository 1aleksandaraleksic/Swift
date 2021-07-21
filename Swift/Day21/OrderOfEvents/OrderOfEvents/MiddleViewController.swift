//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by aleksandar.aleksic on 5/25/21.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var eventNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = label.text{
            label.text = "\(text) \nevent Number \(eventNumber) was view DID LOAD"
        }
        eventNumber += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let text = label.text{
            label.text = "\(text) \nevent Number \(eventNumber) was view WILL APPEAR"
        }
        eventNumber += 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let text = label.text{
            label.text = "\(text) \nevent Number \(eventNumber) was view DID APPEAR"
        }
        eventNumber += 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let text = label.text{
            label.text = "\(text) \nevent Number \(eventNumber) was view WILL DISAPPEAR"
        }
        eventNumber += 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let text = label.text{
            label.text = "\(text) \nevent Number \(eventNumber) was view DID DISAPPEAR"
        }
        eventNumber += 1
    }
    

}
