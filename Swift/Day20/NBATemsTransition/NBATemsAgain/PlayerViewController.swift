//
//  PlayerViewController.swift
//  NBATemsAgain
//
//  Created by aleksandar.aleksic on 5/26/21.
//

import UIKit


struct Player {
    let fullName: String
    let image: String
    let height: String
    let weight: String
    let jerseyNumber: Int
    let position: String
}

class PlayerViewController: UIViewController {
    
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerFullName: UILabel!
    @IBOutlet var playerHeight: UILabel!
    @IBOutlet var playerWeight: UILabel!
    @IBOutlet var playerJerseyNumber: UILabel!
    @IBOutlet var playerPosition: UILabel!
    
    
    var selectedPlayer: String = ""

    let players = [
        Player(fullName: "Luka Doncic", image: "doncic", height: "6'7''", weight: "230 lbs.", jerseyNumber: 77, position: "F-G"),
        Player(fullName: "Boban Marjanovic", image: "marjanovic", height: "7'4''", weight: "290 lbs.", jerseyNumber: 51, position: "C"),
        Player(fullName: "Kristaps Porzingis", image: "porzingis", height: "7'3''", weight: "240 lbs.", jerseyNumber: 6, position: "F-C"),
        Player(fullName: "Nikola Jokic", image: "jokic", height: "6'11''", weight: "284 lbs.", jerseyNumber: 12, position: "C")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for player in players{
            if player.fullName == selectedPlayer{
                playerImage.image = UIImage(named: player.image)
                playerFullName.text = player.fullName
                playerHeight.text = String(player.height)
                playerWeight.text = String(player.weight)
                playerJerseyNumber.text = String(player.jerseyNumber)
                playerPosition.text = player.position
            }
        }
    }
    

}
