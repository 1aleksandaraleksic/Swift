//
//  NotificationVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 9.7.21..
//

import UIKit

class NotificationVC: AudiEventVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableViewNotification: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRow = FetchedData.notificationsList?.count{
            return numberOfRow
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfigData.notificationCell, for: indexPath) as! NotificationTableViewCell
        
        let notification = FetchedData.notificationsList?[indexPath.row]
        
        if let notification = notification{
            let dateTime = notification.sentTime.components(separatedBy: "T")

            cell.notificationDate.text = dateTime[0].replacingOccurrences(of: "-", with: "/")
            cell.notificationTime.text = String(dateTime[1].components(separatedBy: "+")[0].prefix(5))
            cell.notificationTitle.text = notification.title
            cell.notificationDescription.text = notification.body
            
            Helper.makeLabelRadius(radius: 15, label: cell.notificationTime)
            Helper.makeBorderToLabel(borderWitdh: 1, borderColor: UIColor.lightGray.cgColor, label: cell.notificationTime)

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Storico Notifiche"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
    }

}
