//
//  ViewController.swift
//  CatalogOfBasketballPlayer
//
//  Created by aleksandar.aleksic on 5/27/21.
//

import UIKit

struct Player{
    let name: String
    let surname: String
    let height: Double
    let age: Int
    let image: String
    let image2: String
}

class PlayerListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var players: [Player] = []
    
    @IBOutlet var playerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertDataToModelPlayer(fileName: "players", fileExtension: "csv")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? PlayerTableViewCell
        cell?.playerImage.image = UIImage(named: players[indexPath.row].image)
        cell?.playerName.text = players[indexPath.row].name
        cell?.playerSurname.text = players[indexPath.row].surname
        cell?.playerAge.text = String(players[indexPath.row].age)
        cell?.playerHeight.text = String(players[indexPath.row].height)
        
        cell?.preSelectSlider(playerHeight: Float(players[indexPath.row].height))
        cell?.makeImageCircle()
        cell?.makeRadiusToAllLabel(radius: 15)
                
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "playerDetail" {
            let controller = segue.destination as! PlayerDetailVC

            let player = players[self.playerTableView.indexPathForSelectedRow!.row]
            controller.title = "\(player.name) \(player.surname)"
            controller.player = player
        }
    }
    
    func convertDataToModelPlayer(fileName: String, fileExtension:String) {
        
        if let path = Bundle.main.path(forResource: fileName, ofType: fileExtension){
            if let fileContent = try? String(contentsOfFile: path, encoding: String.Encoding.utf8){
                let lineByLineArray = fileContent.split(separator: "\n")
                
                for row in lineByLineArray{
                    
                    let lineToArray = row.split(separator: ",")
                    
                    let name = String(lineToArray[0])
                    let surname = String(lineToArray[1])
                    let age = Int(lineToArray[2]) ?? 0
                    let height = Double(lineToArray[3]) ?? 999
                    let image = String(lineToArray[4])
                    let image2 = String(lineToArray[5])
                    
                    let newPlayer = Player(name: name, surname: surname, height: height, age: age, image: image, image2: image2)
                    
                    players.append(newPlayer)
                }
            }
        }

    }
}

