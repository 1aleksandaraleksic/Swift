//
//  ContactAndInfoModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct ContactAndInfoResponse: Codable, ResultProtocol {
    var data: [ContactAndInfo]
    var result: String
    var resultCode: String
    var resultMessage: String
}

struct ContactAndInfo: Codable {
    var id: String
    var title: String
    // var title 2
    // var textFree
    var contactImage: BackgroundImage
}
