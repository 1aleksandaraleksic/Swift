//
//  ViewController.swift
//  CountriesApp
//
//  Created by aleksandar.aleksic on 6/4/21.
//

import UIKit

protocol CustomSearchControllerDelegate{
    func didStartSearching()

        func didTapOnSearchButton()

        func didTapOnCancelButton()

        func didChangeSearchText(searchText: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    var shouldShowSearchResults: Bool = false
    var customDelegate: CustomSearchControllerDelegate!
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CountriesData.loadListOfCountries(fileName: "countries", fileExtension: "txt")
        searchBar.placeholder = "Search here..."
    }
    
    func configureSearchController(){
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return CountriesData.filteredDataArray.count
        }else{
            return CountriesData.dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForCountry", for: indexPath) as! CountryCellTV
        if !shouldShowSearchResults {
            cell.countryNameLabel.text = CountriesData.filteredDataArray[indexPath.row]
        }else{
            cell.countryNameLabel.text = CountriesData.dataArray[indexPath.row]
        }
        return cell
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidBeginEditing")
        shouldShowSearchResults = true
        customDelegate.didChangeSearchText(searchText: searchBar.text!)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults{
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        
        searchBar.resignFirstResponder()
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        print("updateSearchResults")
        let searchString = searchController.searchBar.text
     
        // Filter the data array and get only those countries that match the search text.
        CountriesData.filteredDataArray = CountriesData.dataArray.filter({ (country) -> Bool in
            let countryText: NSString = NSString(string: country)
     
            return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
     
        // Reload the tableview.
        tableView.reloadData()
    }
    
}

