//
//  PlayerTableViewCell.swift
//  CatalogOfBasketballPlayer
//
//  Created by aleksandar.aleksic on 5/27/21.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerSurname: UILabel!
    @IBOutlet var playerAge: UILabel!
    @IBOutlet var playerHeight: UILabel!
    @IBOutlet var slider: UISlider!
    
    @IBAction func changeHeightToPlayer(_ sender: Any) {
        playerHeight.text = String(slider.value)
    }
    
    func preSelectSlider(playerHeight: Float){
        slider.value = playerHeight
    }
    
    func makeImageCircle() {
        playerImage.layer.cornerRadius = 0.5 * playerImage.bounds.size.width
    }
    
    func makeRadiusToAllLabel(radius: CGFloat) {
        playerName.layer.cornerRadius = radius
        playerName.layer.masksToBounds = true
        
        playerSurname.layer.cornerRadius = radius
        playerSurname.layer.masksToBounds = true
        
        playerAge.layer.cornerRadius = radius
        playerAge.layer.masksToBounds = true
        
        playerHeight.layer.cornerRadius = radius
        playerHeight.layer.masksToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
