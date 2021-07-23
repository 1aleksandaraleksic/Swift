//
//  Extensions.swift
//  MessangerChat
//
//  Created by aleksandar.aleksic on 22.7.21..
//

import Foundation
import UIKit

extension UIView {
    
    public var width: CGFloat{
        return self.frame.size.width
    }
    
    public var height: CGFloat{
        return self.frame.size.height
    }
    
    public var top: CGFloat{
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat{
        return height + top
    }
    
    public var left: CGFloat{
        return self.frame.origin.x
    }
    
    public var right: CGFloat{
        return width + left
    }
}
