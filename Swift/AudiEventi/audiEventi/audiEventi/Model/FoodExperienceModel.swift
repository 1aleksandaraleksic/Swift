//
//  FoodExperienceModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct FoodExperienceResponse: Codable, ResultProtocol {
    var data: [FoodExperience]
    var result: String
    var resultCode: String
    var resultMessage: String
}

struct FoodExperience: Codable {
    var id: String
    var title: String
    var header: String
    var subtitle: FoodSubtitle
    var foodImage: BackgroundImage
    var programExperience: [ProgramExperience]
}

struct FoodSubtitle: Codable {
    var value: String
    var format: String
    var processed: String
}

struct ProgramExperience: Codable {
    var day: String
    var start: String
    var type: String
    var activity: String
    var site: String
    var description: String
    var food: String
    var allergens: String
}
