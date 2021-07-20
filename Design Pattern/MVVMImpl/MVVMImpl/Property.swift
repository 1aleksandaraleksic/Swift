//
//  Property.swift
//  ImplementMVP
//
//  Created by aleksandar.aleksic on 19.7.21..
//

import Foundation

class Property<Type> {
    
    private var subscribeAction :(Type?) -> () = { _ in }
    
    func subscribe(_ closure:@escaping (Type?) -> ()) {
        subscribeAction = closure
        
        if let value = value {
            self.subscribeAction(value)
        }
    }
    
    var value :Type? {
        didSet {
            subscribeAction(value)
        }
    }
    
    init(_ v :Type) {
        value = v
    }
    
}
