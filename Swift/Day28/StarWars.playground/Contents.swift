import UIKit


let starWarsPlanet3 =
"""
{
    "name": "Yavin IV",
    "rotation_period": "24",
    "orbital_period": "4818",
    "diameter": "10200",
    "climate": "temperate, tropical",
    "gravity": "1 standard",
    "terrain": "jungle, rainforests",
    "surface_water": "8",
    "population": "1000",
    "residents": [],
    "films": ["http://swapi.dev/api/films/1/"],
    "created": "2014-12-10T11:37:19.144000Z",
    "edited": "2014-12-20T20:58:18.421000Z",
    "url": "http://swapi.dev/api/planets/3/"
}
"""

struct Planet: Codable{
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

let starWarsPlanetJSON = starWarsPlanet3.data(using: .utf8)

let decoder = JSONDecoder()

if let data = starWarsPlanetJSON, let planet = try? decoder.decode(Planet.self, from: data){
    print("usao u if")
    print(planet)
}
