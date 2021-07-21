//
//  BurgerTableViewCell.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 2.7.21..
//

import UIKit

class BurgerTableViewCell: UITableViewCell {

    @IBOutlet var buttonBurgerMenu: BurgerButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
