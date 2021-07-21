//
//  ViewController.swift
//  Table02
//
//  Created by aleksandar.aleksic on 5/17/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    let daysInWeek = ["Ponedeljak", "Utorak", "Sreda", "Cetvrtak", "Petak", "Subota", "Nedelja"]
    var daysInWeek = ["Ponedeljak", "Utorak", "Sreda", "Cetvrtak"]
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var newWordToInsert: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        daysInWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDay", for: indexPath)
        cell.textLabel?.text = daysInWeek[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newWordToInsert.text = daysInWeek[indexPath.row]
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    @IBAction func addNewWord(_ sender: Any) {

        if let word = newWordToInsert.text{
            if !daysInWeek.contains(word){
                daysInWeek.append(word)
            }else{
                showAlert("Uneta rec vec postoji u tabeli")
            }
        }
        myTableView.reloadData()
    }
    
    @IBAction func deleteSelectedWord(_ sender: Any) {
        
        if let rowToDelete = myTableView.indexPathForSelectedRow?.row{
            daysInWeek.remove(at: rowToDelete)
            myTableView.reloadData()
        }else{
            showAlert("Morate selektovati polje da bi ste mogli da ga obrisete")
        }

    }
    
    @IBAction func updateWord(_ sender: Any) {
        
        if let rowToBeUpdated = myTableView.indexPathForSelectedRow?.row{
            daysInWeek[rowToBeUpdated] = newWordToInsert.text!
            myTableView.reloadData()
        }else{
            showAlert("Morate izabrati polje kako bi ste ga pomerili.")
        }

    }
    
    @IBAction func moveUpper(_ sender: Any) {
        if let rowToBeMoved = myTableView.indexPathForSelectedRow?.row{
            if rowToBeMoved != 0{
                let tempRowValue: String = daysInWeek[rowToBeMoved]
                daysInWeek[rowToBeMoved] = daysInWeek[rowToBeMoved - 1]
                daysInWeek[rowToBeMoved - 1] = tempRowValue
                myTableView.reloadData()
            } else{
                showAlert("Ovo je pocetna pozcija ne moze se pomeriti vise.")
            }
        }else{
            showAlert("Morate izabrati polje kako bi ste ga pomerili.")
        }
    }
    
    @IBAction func moveLover(_ sender: Any) {
        if let rowToBeMoved = myTableView.indexPathForSelectedRow?.row{
            if rowToBeMoved != daysInWeek.count - 1{
                let tempRowValue = daysInWeek[rowToBeMoved]
                daysInWeek[rowToBeMoved] = daysInWeek[rowToBeMoved + 1]
                daysInWeek[rowToBeMoved + 1] = tempRowValue
                myTableView.reloadData()
            } else{
                showAlert("Ovo je poslednja pozicija ne mozete pomeriti dalje.")
            }
        }else{
            showAlert("Morate izabrati polje kako bi ste ga pomerili.")
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Greska", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
}

