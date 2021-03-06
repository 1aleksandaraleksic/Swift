//
//  Planet.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/4/21.
//

import Foundation

struct Planet: Codable {
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}


struct PlanetList: Codable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [Planet]
}
