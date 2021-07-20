//
//  ResultProtocol.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 2.7.21..
//

import Foundation

protocol ResultProtocol {
    var result: String { get set }
    var resultCode: String { get set }
    var resultMessage: String { get set }
}

protocol CouponProtocol { 
    var Coupon: String { get set }
    var EventId: String { get set }
    var Status: String { get set }
    var Valid: String { get set }
}
