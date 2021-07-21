//
//  PremiumEventModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct PremiumEventResponse: Codable, ResultProtocol {
    
    var data: [PremiumEvent]
    var result: String
    var resultCode: String
    var resultMessage: String
    
}

struct PremiumEvent: Codable {
    var id: String
    var title: String
    var description: PremiumDescription
    var headerPremium: String
    var linkMyAudiPremium: LinkMyAudi
    var noteProgram: NoteProgram
    var programDetails: [ProgramDetails]
    var subtitle: String
    var image: BackgroundImage
    
}

struct ProgramDetails: Codable{
    var day:String
    var activities:[Activity]
}


struct PremiumDescription: Codable {
    var value: String
    var format: String
    var processed: String
}

struct NoteProgram: Codable {
    var value: String
    var format: String
    var processed: String
}

struct Activity: Codable{
    var start : String
    var end :String
    var activity: String
}
