//
//  OneCarVC.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 5/31/21.
//

import UIKit

class CarDetailVC: UIViewController, UITableViewDataSource {

    @IBOutlet var manufacturerLogo: UIImageView!
    @IBOutlet var carImage: UIImageView!
    @IBOutlet var carDetailTableView: UITableView!
    @IBOutlet var carPrice: UILabel!
    @IBOutlet var buttonShowHideCell: UIButton!
    
    var showHideAllElement: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataPreparation.transformCarDetailToDictionary()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeButtonName()
        let car = DataPreparation.selectedCar
        manufacturerLogo.image = UIImage(named: (car!.marka!))
        carImage.image = UIImage(named: (car!.model!))
        carPrice.text = "Price: \(DataPreparation.formatPriceOfCar(car!.cena!))"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showHideAllElement{
            return 10
        }
        return DataPreparation.arrayOfSelectedCarDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carDetailCell", for: indexPath) as! CellForCarDetailTV

        cell.descriptionName.text = "\(DataPreparation.arrayOfSelectedCarDetail[indexPath.row]![0])"
        cell.descriptionDetail.text = "\(DataPreparation.arrayOfSelectedCarDetail[indexPath.row]![1])"

        return cell
    }
    
    
    @IBAction func changeFlag(_ sender: Any) {
        showHideAllElement = !showHideAllElement
        changeButtonName()
        carDetailTableView.reloadData()
    }
    
    func changeButtonName(){
        if showHideAllElement{
            buttonShowHideCell.setTitle("Show", for: .normal)
        }else{
            buttonShowHideCell.setTitle("Hide", for: .normal)
        }
    }
    
}
