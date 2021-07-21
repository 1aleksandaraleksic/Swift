//
//  ViewController.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let _ = ManageData.fetchPlanetList()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
}

