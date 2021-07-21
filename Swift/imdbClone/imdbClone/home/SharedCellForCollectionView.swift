//
//  WhatToWatchCollectionViewCell.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/17/21.
//

import UIKit

class SharedCellForCollectionView: UICollectionViewCell {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var imdbRating: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYearAndDuration: UILabel!
    
    @IBOutlet var buttonWatchListOrNow: UIButton!
}
