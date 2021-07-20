//
//  CouponModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 2.7.21..
//

import Foundation

struct CouponVerification: Codable, CouponProtocol, ResultProtocol{
    var Coupon: String
    var EventId: String
    var Status: String
    var Valid: String
    var result: String
    var resultCode: String
    var resultMessage: String
    
}

struct CouponValidation: Codable, CouponProtocol, ResultProtocol{
    var Action: String
    var Coupon: String
    var EventId: String
    var Status: String
    var Valid: String
    var result: String
    var resultCode: String
    var resultMessage: String    
}
