//
//  ViewController.swift
//  drzave
//
//  Created by aleksandar.aleksic on 5/18/21.
//

import UIKit

struct Drzava{
    var ime: String
    var gradovi: [String]
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let nizDrzava = [
        Drzava(ime: "Srbija",
               gradovi: ["Beograd", "Novi Sad", "Nis"]),
        Drzava(ime: "Nemacka",
               gradovi: ["Berlin", "Keln", "Hamburg", "Minhen"]),
        Drzava(ime: "Francuska",
               gradovi: ["Pariz", "Marsej", "Nica"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return nizDrzava.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nizDrzava[section].gradovi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = nizDrzava[indexPath.section].gradovi[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nizDrzava[section].ime
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return String(nizDrzava[section].gradovi.count)
    }
}

