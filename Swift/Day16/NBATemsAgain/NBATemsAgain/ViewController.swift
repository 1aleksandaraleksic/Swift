//
//  ViewController.swift
//  NBATemsAgain
//
//  Created by aleksandar.aleksic on 5/19/21.
//

import UIKit

struct Team {
    let name: String
    let logo: String
    let masccot: String
    let city: String
    let players: [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let model:[Team] = [
//        Team(name: "",
//             logo: "",
//             masccot: "",
//             city: "",
//             players: []),
        Team(name: "Chicago Bulls",
             logo: "chicago_bulls_log",
             masccot: "BennyTheBull",
             city: "Chicago",
             players: ["Lauri Markkanen","Zak La Vine","Nikola Vucevic", "Javonte Green", "Tomas Satoransky", "Daniel Theis", "Coby White", "Garrett Temple"]),
        Team(name: "Dallas Mavericks",
             logo: "dallas_mavs",
             masccot: "CHAMP1",
             city: "Dallas",
             players: ["Boban Marjanovic","Luka Doncic","Kristaps Porzingis","JJ Redick", "Nicolo Melli", "Willie Cauley‑Stein", "Tyler Bey"]),
        Team(name: "Denver Nuggets",
             logo: "denver_nuggets",
             masccot: "rocky",
             city: "Denver",
             players: ["Nikola Jokic", "Porter Jr.","Will Barton", "Bol Bol", "Facundo Campazzo", "Vlatko Cancar", "Aaron Gordon", "JaMychal Green"]),
        Team(name: "Atlanta Hawks",
             logo: "atlanta_hawks",
             masccot: "harry",
             city: "Atlanta",
             players: ["Bogdan Bogdanovic", "Clint Capela", "Kris Dunn", "Danilo Gallinari", "Kevin Huerter", "Trae Young", "Lou Williams", "Tony Snell"]),
        Team(name: "L.A. Lakers",
             logo: "la_lakers",
             masccot: "la_lakers_old_mascote",
             city: "Los Angeles",
             players: ["Alex Caruso", "Anthony Davis", "Andre Drummond", "Marc Gasol","Montreyl Harrell", "LeBron James", "Kyle Kuzma", "Dennis Schroder"]),
        Team(name: "Golden State Warriors",
             logo: "golden_state_warriors_logo",
             masccot: "empty_image",
             city: "Golden State",
             players: ["Stephen Curry", "Draymond Green", "Kelly Oubre Jr.", "Alen Smailagic", "Klay Thompson", "Andrew Wiggins"]),
        Team(name: "Boston Celtics",
             logo: "boston_celtics_logo",
             masccot: "boston_mascote",
             city: "Boston",
             players: ["Tacko Fall", "Jaylen Brown", "Evan Fournier", "Jabari Parker", "Marcus Smart", "Jayson Tatum", "Tristan Thompson", "Kemba Walker"]),
        Team(name: "Brooklyn Nets",
             logo: "brooklyn_nets",
             masccot: "empty_image",
             city: "New York",
             players: ["Kevin Durant", "Jeff Green", "Blake Griffin", "Jamse Harden", "Joe Harris", "Kyrie Irving", "Mike James", "DeAndre Jordan", "Timothe Luwawu-Cabarrot", "Landry Shamet"]),
        Team(name: "New York knicks",
             logo: "new_york_knicks",
             masccot: "empty_image",
             city: "New York",
             players: ["RJ Barrett", "Reggie Bullock", "Taj Gibson", "Nerlens Noel", "Julius Randle", "Derrick Rose"]),
        Team(name: "Philadelphia 76ers",
             logo: "philadelphia_76ers_logo",
             masccot: "sixers-franklin-1",
             city: "Philadelphia",
             players: ["Joel Embiid", "Seth Curry", "Danny Green", "Tobias Harris", "George Hill", "Dwight Howard", "Furkan Korkmaz", "Ben Simmons"]),
        Team(name: "Toronto Raptors",
             logo: "toronto_raptors",
             masccot: "the_raptor",
             city: "Toronto",
             players: ["Aaron Baynes", "Chris Boucher", "Kyle Lowry", "Pascal Siakam", "Gary Trent Jr.", "Fred VanVleet", "OG Anunoby"]),
        Team(name: "Cleveland Cavaliers",
             logo: "cleveland_logo",
             masccot: "moondog",
             city: "Cleveland",
             players: ["Jarrett Allen", "Matthew Dellavedova", "Kevin Love", "Larry Nance Jr.", "Cedi Osman", "Collin Sexton"]),
        Team(name: "Detroit Pistons",
             logo: "detroit_pistons",
             masccot: "detroit_pistons_mascote",
             city: "Detroit",
             players: ["Dennis Smith Jr.", "Hamidou Diallo", "Jahlil Okafor", "Jaremi Grant", "Mason Plumlee", "Josh Jackson"]),
        Team(name: "Milwaukee Bucks",
             logo: "milwaukee_bucks_logo",
             masccot: "bango_the_buck",
             city: "Milwaukee",
             players: ["Giannis Antetokounmpo", "Thanasis Antetokounmpo", "Pat Connaughton", "Donte DiVincenzo", "Jrue Holiday", "Brook Lopez", "Khris Middleton", "Bobby Portis", "Jeff Teague", "P.J. Tucker"]),
        Team(name: "Indiana Pacers",
             logo: "indiana_pacers",
             masccot: "indiana_pacers_boomer",
             city: "Indiana",
             players: ["Goga Bitadze", "Malcolm Brogdon", "Justin Holiday", "Jeremy Lamb", "T.J. McConnell", "Domantas Sabonis", "T.J. Warren"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var oneTeamLogo: UIImageView!
    @IBOutlet var oneTeamMascot: UIImageView!
    @IBOutlet var oneTeamName: UILabel!
    @IBOutlet var oneTeamCity: UILabel!
    
    @IBOutlet var playerListTable: UITableView!
    @IBOutlet var nbaTeamList: UITableView!
    
    var indexRow: Int = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == playerListTable{
            return model[indexRow].players.count
        }else if tableView == nbaTeamList {
            return model.count
        }
        return 0
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == playerListTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = String(model[indexRow].players[indexPath.row])
            return cell
        }else if tableView == nbaTeamList{
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as? NBATeamTableViewCell
            cell?.logoImage.image = UIImage(named: model[indexPath.row].logo)
            cell?.mascoteImage.image = UIImage(named: model[indexPath.row].masccot)
            cell?.teamName.text = String(model[indexPath.row].name)
            cell?.teamCity.text = String(model[indexPath.row].city)
            return cell!
        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == nbaTeamList {
            oneTeamName.text = model[indexPath.row].name
            oneTeamCity.text = model[indexPath.row].city
            oneTeamMascot.image = UIImage(named: model[indexPath.row].masccot)
            oneTeamLogo.image = UIImage(named: model[indexPath.row].logo)
            indexRow = indexPath.row
            playerListTable.reloadData()
        }
    }



}

