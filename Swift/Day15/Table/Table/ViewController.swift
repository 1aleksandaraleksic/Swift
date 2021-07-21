//
//  ViewController.swift
//  Table
//
//  Created by aleksandar.aleksic on 5/17/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let country = ["Serbia", "Montenegro", "Greece", "Croatia", "Italy"]
    
    @IBOutlet var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = country[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
    }


}

