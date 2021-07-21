//
//  ButtonForFilterCollectionViewCell.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/23/21.
//

import UIKit

class ButtonForFilterCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       prepareButton()
    }
    
    @IBOutlet var buttonForFilter: UIButton!
    
    func prepareButton(){
        buttonForFilter.layer.cornerRadius = 15
        buttonForFilter.tintColor = .white
        buttonForFilter.layer.borderWidth = 1
        buttonForFilter.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
    
}
