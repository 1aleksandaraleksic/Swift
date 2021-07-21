//
//  EventiListVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 7.7.21..
//

import UIKit

class EventListVC: AudiEventVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var eventiListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eventiListTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfEventi = FetchedData.publicEventiList?.count{
            return numberOfEventi
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventiListCell", for: indexPath) as! EventiListTableViewCell
        
        let eventi = FetchedData.publicEventiList?[indexPath.row]
        if let urlString = eventi?.backgroundImage?.href, let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url){ (data,response,error) in
                if let data = data{
                    DispatchQueue.main.async {
                        cell.imageEventi.image = UIImage(data: data)
                    }
                }

            }.resume()
        }

        cell.titleEventi.text = eventi?.title
        cell.descriptionEventi.text = eventi?.description.value
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(380)
    }
    
}
