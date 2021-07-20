//
//  CheckBoxButton.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/29/21.
//

import UIKit

class CheckBoxButton: UIButton {
    

    override func awakeFromNib() {
        self.setImage(UIImage(named:"icons8-checked-checkbox-24"), for: .selected)
        self.setImage(UIImage(named:"icons8-unchecked-checkbox-24"), for: .normal)
        self.addTarget(self, action: #selector(CheckBoxButton.buttonClicked(_:)), for: .touchUpInside)
    }

    @objc func buttonClicked(_ sender: UIButton) {
        self.isSelected = !self.isSelected
     }

}
