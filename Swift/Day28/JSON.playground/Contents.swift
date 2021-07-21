import UIKit

//let jsonString: String = "{ \"ime\": \" Pera Peric\", \"starost\": 29}"
//
//struct Osoba: Codable {
//    var ime: String
//    var starost: Int
//}
//
//let jsonData = jsonString.data(using: .utf8)
//
//let decoder = JSONDecoder()
//
//if let data = jsonData, let osoba = try? decoder.decode(Osoba.self, from: data){
//    print(osoba)
//}
//
//
//print("kraj")

// zadatak:
// a) preuzeti model zemlje i gradovi i sprovesti proceduru enkodiranja u JSON
// b) napraviti jedan string i od tog json-a modifikovati podatak i vratiti te podatke u swift objekte

struct Zemlja: Codable{
    var naziv: String
    var gradovi: [String]
}

var zemlje = [
    Zemlja(naziv: "Srbija", gradovi:["Beograd", "Nis", "Novi Sad"]),
    Zemlja(naziv: "Nemacka", gradovi: ["Berlin", "Keln", "Hamburg", "Minhen"]),
    Zemlja(naziv: "Austrija", gradovi: ["Bec", "Salcburg", "Linz"]),
    Zemlja(naziv: "Italija", gradovi: ["Rim", "Milano", "Trst"])

]


//let encoder = JSONEncoder()
//
//let dataJ = try? encoder.encode(zemlje)
//
//if let jsonData = jsonData, let jsonString = String(data: dataJ, encoding: .utf8){
//    print(jsonString)
//}



let string = """

{

"copyright": "Binounistan.com",

"date": "2019-02-12",

"explanation": "No, this is not a good way to get to the Moon. What is pictured is a chance superposition of an airplane and the Moon. The contrail would normally appear white, but the large volume of air toward the setting Sun preferentially knocks away blue light, giving the reflected trail a bright red hue.  Far in the distance, well behind the plane, is a crescent Moon, also slightly reddened.  Captured a month ago above Valais, Switzerland, the featured image was taken so soon after sunset that planes in the sky were still in sunlight, as were their contrails. Within minutes, unfortunately, the impromptu sky show ended.  The plane crossed the Moon and moved out of sight.  The Moon set.  The contrail became unilluminated and then dispersed.",

"hdurl": "https://apod.nasa.gov/apod/image/1902/PlaneTrailMoon_Staiger_1555.jpg",

"media_type": "image",

"service_version": "v1",

"title": "Plane Crossing a Crescent Moon",

"url": "https://apod.nasa.gov/apod/image/1902/PlaneTrailMoon_Staiger_960.jpg"

}

"""

struct News: Codable{
    let copyright: String
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let service_version: String
    let title: String
    let url: String
    
//    enum CodingKeys: String, CodingKeys{
//
//        case copyright,
//        case date,
//        case explanation,
//        case hdurl,
//        case mediaType = "media_type"
//    }
}

let jsonData = string.data(using: .utf8)

let decoder = JSONDecoder()

if let data = jsonData, let news = try? decoder.decode(News.self, from: data){
    print(news)
}

let string2 =  """

{
"coord": {
"lon": -0.13,
"lat": 51.51
},
"weather": [{
"id": 300,
"main": "Drizzle",
"description": "light intensity drizzle",
"icon": "09d"
}]
}

"""
struct Coord:Codable{
    let lon: Double
    let lat: Double
}

struct Weather:Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherWithLocation: Codable{
    let coord: Coord
    let weather: [Weather]
}

let jsonDataWeather = string2.data(using: .utf8)

if let data = jsonDataWeather, let weather = try? decoder.decode(WeatherWithLocation.self, from: data){
//    print(weather)
}




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
    "films": [
        "http://swapi.dev/api/films/1/"
    ],
    "created": "2014-12-10T11:37:19.144000Z",
    "edited": "2014-12-20T20:58:18.421000Z",
    "url": "http://swapi.dev/api/planets/3/"
}
"""

struct Planet: Codable{
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

let starWarsPlanetJSON = starWarsPlanet3.data(using: .utf8)

let newDecoder = JSONDecoder()

if let data = starWarsPlanetJSON{
    print(<#T##items: Any...##Any#>)
    if let planet = try? newDecoder.decode(Planet.self, from: data){
        print("usao u if")
        print(planet)
    }
}










