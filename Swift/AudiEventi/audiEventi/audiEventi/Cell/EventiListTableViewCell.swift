//
//  EventiListTableViewCell.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 7.7.21..
//

import UIKit

class EventiListTableViewCell: UITableViewCell {

    @IBOutlet var imageEventi: UIImageView!
    @IBOutlet var titleEventi: UILabel!
    @IBOutlet var descriptionEventi: UILabel!
    @IBOutlet var buttonEventi: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
