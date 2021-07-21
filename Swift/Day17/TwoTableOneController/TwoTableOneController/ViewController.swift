//
//  ViewController.swift
//  TwoTableOneController
//
//  Created by aleksandar.aleksic on 5/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let firstData = [1,2,3,4,5,6,7,8,9,10]
    let secondData = ["one","two","three","four","five","six","seven", "eight", "nine", "ten"]
    
    @IBOutlet var firstTable: UITableView!
    @IBOutlet var secondTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstTable == tableView ? firstData.count : secondData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == firstTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableCell") as? MyFirstCell
            cell?.labelForFirstCell.text = String(firstData[indexPath.row])
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableCell") as? MySecondCell
            cell?.labelForSecondCell.text = secondData[indexPath.row]
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.backgroundColor == .green{
            tableView.cellForRow(at: indexPath)?.backgroundColor = .white
        }else{
            tableView.cellForRow(at: indexPath)?.backgroundColor = .green
        }

    }


    
}

