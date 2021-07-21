//
//  StudentTableViewCell.swift
//  ReadDataFromFileToList
//
//  Created by aleksandar.aleksic on 5/24/21.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var averageMarkLabel: UILabel!
    
}
