//
//  ViewController.swift
//  customTableCell
//
//  Created by aleksandar.aleksic on 5/18/21.
//

import UIKit

struct SocijalnaMreza {
    let nazivMreze: String
    let logo: String
    let urlAdresa: String
    let brojKorisnika: Int
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let model = [
        SocijalnaMreza(nazivMreze: "Facebook",
                       logo: "facebook",
                       urlAdresa: "www.facebook.com",
                       brojKorisnika: 1_000_000_000),
        SocijalnaMreza(nazivMreze: "Skype",
                       logo: "skype",
                       urlAdresa: "www.skype.com",
                       brojKorisnika: 1_500_000),
        SocijalnaMreza(nazivMreze: "Google+", logo: "google", urlAdresa: "www.google.com", brojKorisnika: <#T##Int#>)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? MyCustomCell
        
        cell?.logo.image = UIImage(named: model[indexPath.row].logo)
        cell?.networkName.text = String(model[indexPath.row].nazivMreze)
        cell?.networkUrl.text = String(model[indexPath.row].urlAdresa)
        cell?.numberOfUsers.text = String(model[indexPath.row].brojKorisnika)
        return cell!
    }
}

