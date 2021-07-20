//
//  AudiDriveExperienceModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct AudiDriveExperienceResponse: Codable, ResultProtocol{
    var data: AudiDriveExperience
    var result: String
    var resultCode: String
    var resultMessage: String
}

struct AudiDriveExperience: Codable{
    var id: String
    var description: String
    var subtitleAde: String
    var titleAde: String
    var sliderImage: [BackgroundImage]
    var imageAde: BackgroundImage
}
