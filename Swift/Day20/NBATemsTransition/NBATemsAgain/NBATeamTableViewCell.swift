//
//  NBATeamTableViewCell.swift
//  NBATemsAgain
//
//  Created by aleksandar.aleksic on 5/19/21.
//

import UIKit

class NBATeamTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var mascoteImage: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamCity: UILabel!
    
}
