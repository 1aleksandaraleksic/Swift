//
//  OneTeamViewController.swift
//  NBATemsAgain
//
//  Created by aleksandar.aleksic on 5/26/21.
//

import UIKit

class OneTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var team: Team = Team(name: "", logo: "", masccot: "", city: "", players: [])

    @IBOutlet var mascoteLogoImage: UIImageView!
    @IBOutlet var teamLogoImage: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamCity: UILabel!
    
    @IBOutlet var playersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playersTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View did appear")
        mascoteLogoImage.image = UIImage(named: team.masccot)
        teamLogoImage.image = UIImage(named: team.logo)
        teamName.text = team.name
        teamCity.text = team.city
//        playersTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell2", for: indexPath)
        cell.textLabel?.text = String(team.players[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer"{
            let controller = segue.destination as! PlayerViewController
            controller.selectedPlayer = team.players[self.playersTableView.indexPathForSelectedRow!.row]
        }
    }
}
