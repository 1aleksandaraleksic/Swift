//
//  ViewController.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import UIKit

class HomeGuestVC: AudiEventVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
        
    }
    
    @IBAction func eventList(_ sender: Any) {
        showViewController(identifier: ConfigData.eventListViewController, driveTeritory: 0)
    }
    @IBAction func cuponDialog(_ sender: Any) {
        showAlertForCoupon()
    }
    
}

