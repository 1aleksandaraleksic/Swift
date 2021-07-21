//
//  MyCustomCell.swift
//  customTableCell
//
//  Created by aleksandar.aleksic on 5/18/21.
//

import UIKit

class MyCustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var logo: UIImageView!
    @IBOutlet var networkName: UILabel!
    @IBOutlet var networkUrl: UILabel!
    @IBOutlet var numberOfUsers: UILabel!
    
}
