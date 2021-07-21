//
//  HomeVC.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 5/31/21.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllModelsSegue"{
            let _ = segue.destination as! ListOfCarsManufacturerVC
        }
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.barTintColor = UIColor.systemGray2
    }
        

}
