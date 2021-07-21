//
//  CellForPlanetDetailTV.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import UIKit

class CellForPlanetDetailTV: UITableViewCell {

    @IBOutlet var planetDetailName: UILabel!
    @IBOutlet var planetDetailValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
