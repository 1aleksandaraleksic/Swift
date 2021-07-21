//
//  PlanetDetailVC.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import UIKit

class PlanetDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var planet: Planet?
    var selectedPlanet: Int = 0
    var selectedDetail: Int = 0

    @IBOutlet var planetImage: UIImageView!
    @IBOutlet var planetTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareDataToShow()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch selectedDetail {
        case 0:
            return ManageData.preparedDetailPlanetToShow.count
        case 1:
            return ManageData.residentsForSelectedPlanet.count
        case 2:
            return ManageData.filmsForSelectedPlanet.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetDetailCell", for: indexPath) as! CellForPlanetDetailTV
        var planetDetail:[String]?
        
        switch selectedDetail {
        case 0:
            planetDetail = ManageData.preparedDetailPlanetToShow[indexPath.row]!
        case 1:
            planetDetail = ManageData.residentsForSelectedPlanet[indexPath.row]!
        case 2:
            planetDetail = ManageData.filmsForSelectedPlanet[indexPath.row]!
        default:
            planetDetail = [""]
        }
        cell.planetDetailName.text = planetDetail?[0]
        
        cell.planetDetailValue.text = planetDetail?[1]
        return cell
    }
    
    
    @IBAction func showPlanetDetail(_ sender: Any) {
        selectedDetail = 0
        if ManageData.prepereDetailForPlanet(planetName: ManageData.selectedPlanet!.name, planetData: 0){
            planetTableView.reloadData()
        }
    }
    
    @IBAction func showPlanetResidents(_ sender: Any) {
        selectedDetail = 1
        if ManageData.prepereDetailForPlanet(planetName: ManageData.selectedPlanet!.name, planetData: 1){
            planetTableView.reloadData()
        }
    }

    @IBAction func showPlanetFilms(_ sender: Any) {
        selectedDetail = 2
        if ManageData.prepereDetailForPlanet(planetName: ManageData.selectedPlanet!.name, planetData: 2){
            planetTableView.reloadData()
        }
    }
    
//    func reloadTableView(value: Bool, closure: @escaping (Bool) -> Void){
//        guard value else { return }
//        closure(value)
//        planetTableView.reloadData()
//    }
    
    func prepareDataToShow(){
        planetImage.image = UIImage(named: ManageData.selectedPlanet!.name)
    }

}
