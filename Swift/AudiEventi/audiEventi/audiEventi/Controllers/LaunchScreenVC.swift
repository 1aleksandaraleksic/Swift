//
//  LaunchScreenVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 6.7.21..
//

import UIKit

class LaunchScreenVC: AudiEventVC {

    @IBOutlet var loaderActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        loaderActivity.startAnimating()
        
        DispatchQueue.main.async {
            TestData.populateTestData()
            FetchedData.fetchElementsNameList()
        }
        
        performSegue(withIdentifier:
                        isUserAuthenticated ? ConfigData.segueHomePremiumVC : ConfigData.segueHomeGuestVC, sender: self)
    }

}
