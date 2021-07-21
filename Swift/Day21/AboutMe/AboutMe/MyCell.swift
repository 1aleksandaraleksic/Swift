//
//  MyCell.swift
//  AboutMe
//
//  Created by aleksandar.aleksic on 5/25/21.
//

import UIKit

class MyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBOutlet var companyName: UILabel!
    @IBOutlet var dateStartEnd: UILabel!
    @IBOutlet var Description: UILabel!
    
}
