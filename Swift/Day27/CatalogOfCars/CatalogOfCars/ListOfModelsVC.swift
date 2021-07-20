//
//  ListOfModelsVC.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 5/31/21.
//

import UIKit

class ListOfModelsVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet var modelCollectionView: UICollectionView!
    @IBOutlet var manufacturerLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let manufacturer = DataPreparation.selectedManufacturerWithModel[0].marka{
            manufacturerLogo.image = UIImage(named: String(manufacturer))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataPreparation.selectedManufacturerWithModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "modelCell", for: indexPath) as? CellForTwoModelInRowCV
        
        let car = DataPreparation.selectedManufacturerWithModel[indexPath.row]

        cell?.nameLabel.text = "\(car.model!)"
        cell?.priceLabel.text = "\(DataPreparation.formatPriceOfCar(car.cena!))"
        cell?.imageView.image = UIImage(named: "\(car.model!)")
        
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = UIColor.red.cgColor
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 60) / 2
        var height = width
        
        if UIScreen.main.bounds.height <= 700{
            height = width + 60
        }

        return CGSize(width: width, height: height)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modelSegue"{
           
            DataPreparation.selectedCar = DataPreparation.selectedManufacturerWithModel[self.modelCollectionView!.indexPath(for: sender as! UICollectionViewCell)!.row]
            
            let controller = segue.destination as! CarDetailVC
            controller.title = DataPreparation.selectedManufacturerWithModel[self.modelCollectionView!.indexPath(for: sender as! UICollectionViewCell)!.row].model
        }
    }

}
