//
//  CellForPlanetListTV.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import UIKit

class CellForPlanetListTV: UITableViewCell {

    @IBOutlet var ordinalNumberLabel: UILabel!
    @IBOutlet var planetNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
