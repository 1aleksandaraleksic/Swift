//
//  PlanetListVC.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import UIKit

class PlanetListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var planetListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManageData.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as! CellForPlanetListTV
        cell.ordinalNumberLabel.text = "\(indexPath.row + 1)"
        cell.planetNameLabel.text = ManageData.dataArray[indexPath.row].name
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if ManageData.fetchPlanetList(){
            planetListTableView.reloadData()
            print("scroll f-ja true")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planetDetail"{
            let controller = segue.destination as! PlanetDetailVC
            controller.selectedPlanet = self.planetListTableView!.indexPath(for: sender as! UITableViewCell)!.row
            ManageData.selectedPlanet = ManageData.dataArray[controller.selectedPlanet]
            ManageData.prepereDetailForPlanet(planetName: ManageData.selectedPlanet!.name, planetData: 0)
        }
    }

    // MARK: Change status bar color
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
