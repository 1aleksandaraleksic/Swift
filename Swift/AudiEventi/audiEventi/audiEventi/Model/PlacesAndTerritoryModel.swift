//
//  PlacesAndTerritoryModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct PlacesAndTerritoryResponse: Codable, ResultProtocol {
    var data: PlacesAndTerritory
    var result: String
    var resultCode: String
    var resultMessage: String
}

struct PlacesAndTerritory: Codable {
    var id: String
    var title: String
    var description: String
    var placeSubtitle: String
    var placeTitle: String
    var placesSlider: [BackgroundImage]
    var imagePlace: BackgroundImage
}
