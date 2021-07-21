//
//  Model.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct PublicEvent: Codable {
    var id: String
    var title: String
    var description: PublicDescription
    var dataEvent: String
    var linkMyAudi: LinkMyAudi
    var priority: Int
    var status: String
    var backgroundImage: BackgroundImage?
    
//    enum CodingKeys: String, CodingKey {
//        case id = "ID"
//        case title = "Title"
//        case description = "Description"
//        case dataEvent = "DataEvent"
//        case linkMyAudi = "LinkMyAudi"
//        case priority = "Priority"
//        case status = "Status"
//        case backgroundImage = "BackgroundImage"
//    }

}

struct BackgroundImage: Codable {
    var id: String
    var href: String
    var meta: Meta
}

struct Meta: Codable {
    var alt: String
    var title: String
    var width: Int
    var height: Int
}

struct LinkMyAudi: Codable {
    var uri: String
    var title: String
    var options: [Option]
}

//typical empty ??
struct Option: Codable{
    
}

struct PublicDescription: Codable {
    var format: String
    var value: String
}


