//
//  FilterForTableViewVC.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/23/21.
//

import UIKit

class FilterForTableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var genreTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticDataForApp.genreForFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreTableView.dequeueReusableCell(withIdentifier: "cellForGenreFilter", for: indexPath)
        
        cell.textLabel?.text = StaticDataForApp.genreForFilter[indexPath.row]
        cell.textLabel?.textColor = .white
        
        return cell
    }
    

}
