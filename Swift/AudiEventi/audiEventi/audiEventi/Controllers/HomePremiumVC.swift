//
//  HomePremiumVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 12.7.21..
//

import UIKit

class HomePremiumVC: AudiEventVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
        infoContacts.isUserInteractionEnabled = true
        
    }
    
    @IBOutlet var infoContacts: UILabel!
    
}
