//
//  NotificationTableViewCell.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 9.7.21..
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet var notificationDate: UILabel!
    @IBOutlet var notificationTitle: UILabel!
    @IBOutlet var notificationTime: UILabel!
    @IBOutlet var notificationDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
