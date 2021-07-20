//
//  NotificationShortListModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 9.7.21..
//

import Foundation

struct Notifications: Codable{
    var status: String
    var statusCode: String
    var sentTime: String
    var title: String
    var topic: String
    var deepLink: String
    var body: String
}
