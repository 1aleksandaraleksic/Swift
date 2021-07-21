//
//  Helper.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 12.7.21..
//

import Foundation
import UIKit

class Helper{
    
    static func makeLabelRadius(radius: CGFloat, label: UILabel){
        label.layer.cornerRadius = radius
        label.layer.masksToBounds = true
    }
    
    static func makeBorderToLabel(borderWitdh: CGFloat, borderColor: CGColor, label: UILabel){
        label.layer.borderWidth = borderWitdh
        label.layer.borderColor = borderColor
    }
}
