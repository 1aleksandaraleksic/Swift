//
//  BoxOfficeTableViewCell.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/22/21.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    
    @IBOutlet var positionOfMovie: UILabel!
    @IBOutlet var buttonWatchlist: UIButton!
    @IBOutlet var nameOfMovie: UILabel!
    @IBOutlet var boxOfficeOfMovie: UILabel!
    @IBOutlet var buttonShowTimes: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
