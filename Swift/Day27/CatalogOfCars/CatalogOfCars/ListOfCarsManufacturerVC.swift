//
//  ListOfCarsManufacturerVC.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 5/31/21.
//

import UIKit

class ListOfCarsManufacturerVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UISearchBarDelegate {
    
    var searchViewHidden: Bool = true
    
    @IBOutlet var searchField: UIView!
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var textForSearch: UISearchBar!
    
    @IBAction func filterManufacturerList(_ sender: Any) {
        showLableForSearch()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        setBackgroundToView()
        createSearchButton()
        searchField.isHidden = searchViewHidden
        myCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataPreparation.filteredCarManufacturers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? CellForTwoManufacturerCV
     
        cell?.labelView.text = DataPreparation.filteredCarManufacturers[indexPath.row]
        cell?.imageView.image = UIImage(named: DataPreparation.filteredCarManufacturers[indexPath.row])
        
        cell?.layer.borderWidth = 2
        cell?.layer.borderColor = UIColor.blue.cgColor

        cell?.layer.backgroundColor = UIColor.white.cgColor
        return cell!
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 60) / 2
        var height = width
        
        if UIScreen.main.bounds.height <= 700{
            height = width + 45
        }

        return CGSize(width: width, height: height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "manufacturerModelsSegue"{
            
            DataPreparation.selectedModel(selectedManufacturerID: self.myCollectionView!.indexPath(for: sender as! UICollectionViewCell)!.row)

            let controller = segue.destination as! ListOfModelsVC
            controller.title = DataPreparation.selectedManufacturerWithModel[self.myCollectionView!.indexPath(for: sender as! UICollectionViewCell)!.row].marka
        }
    }

    func setBackgroundToView(){
        view.backgroundColor = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0)
        myCollectionView.backgroundColor = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0)
    }
    
    func createSearchButton(){
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showLableForSearch))
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func showLableForSearch(){
        searchViewHidden = !searchViewHidden
        searchField.isHidden = searchViewHidden
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DataPreparation.searchByModelOrManufacturer(textForSearch: searchText)
        myCollectionView.reloadData()
    }
}
