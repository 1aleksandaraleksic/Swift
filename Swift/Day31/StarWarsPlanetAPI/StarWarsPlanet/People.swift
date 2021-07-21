//
//  People.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import Foundation

struct People: Codable{
    var name: String
    var height: String
    var mass: String
    var hair_color: String
    var skin_color: String
    var eye_color: String
    var birth_year: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    var created: String
    var edited: String
    var url: String
}
