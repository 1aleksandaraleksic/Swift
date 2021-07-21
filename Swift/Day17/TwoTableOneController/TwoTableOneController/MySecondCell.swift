//
//  MySecondCell.swift
//  TwoTableOneController
//
//  Created by aleksandar.aleksic on 5/19/21.
//

import UIKit

class MySecondCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet var labelForSecondCell: UILabel!
}
