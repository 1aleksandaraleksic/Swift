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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var mascoteImage: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamCity: UILabel!
    
}
