//
//  ViewController.swift
//  Telefoni
//
//  Created by aleksandar.aleksic on 5/18/21.
//

import UIKit

struct MobileCompany{
    var company: String
    var phoneModel: [String]
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let nizKompanija = [
        MobileCompany(company: "Samsung",
                      phoneModel: ["J5","J7","s20","s10","s50"]),
        MobileCompany(company: "Apple",
                      phoneModel: ["X","12Pro","12","12 Pro Max", "12 mini"]),
        MobileCompany(company: "Huawei", phoneModel: ["P40","P40 lite", "P40 PRO"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return nizKompanija.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nizKompanija[section].phoneModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        if indexPath.row % 2 == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "myAnotherCell", for: indexPath)
        }
        
        cell.textLabel?.text = nizKompanija[indexPath.section].phoneModel[indexPath.row]
        
        return cell
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//
//        cell.textLabel?.text = nizKompanija[indexPath.section].phoneModel[indexPath.row]
//        if indexPath.row % 2 == 0{
//            cell.backgroundColor = .cyan
//        }else{
//            cell.backgroundColor = .purple
//        }
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(nizKompanija[section].company)
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return String(nizKompanija[section].phoneModel.count)
    }
}

