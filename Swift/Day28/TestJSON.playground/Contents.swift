import UIKit


// Decoder (from JSON to Object)
let jsonString: String = "{ \"ime\": \" Pera Peric\", \"starost\": 29}"

struct Osoba: Codable{
    var ime: String
    var starost: Int
}

let jsonData = jsonString.data(using: .utf8)

let decoder = JSONDecoder()

if let data = jsonData, let osoba = try? decoder.decode(Osoba.self, from: data){
    print(osoba)
}

//Encoder (from Object to JSON)

let osoba = Osoba(ime: "Milos Milosevic", starost: 22)

let encoder = JSONEncoder()

let osobaEncode = try? encoder.encode(osoba)

if let jsonData = osobaEncode, let jsonString = String(data: jsonData, encoding: .utf8){
    print(jsonString)
}


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

// encoder created on 24-line in playground

let zemljeEncode = try? encoder.encode(zemlje)

if let zemljeJSONData = zemljeEncode, let zemljeJSONString = String(data: zemljeJSONData, encoding: .utf8){
    print(zemljeJSONString)
}

// zadatak:
//      prevesti JSON u objekat

let jsonNews1 = """

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

struct News: Codable {
    var copyright: String
    var date: String
    var explanation: String
    var hdurl: String
    var mediaType: String
    var serviceVersion: String
    var title: String
    var url: String

    // CodingKeys - ukoliko zelimo da drugacije nazivamo property od onoga sto dobijamo u JSON-u i obratno
    // ukoliko saljemo JSON za property ima drugaciji naziv nego sto ga mi koristimo u kodu. Dakle sluzi za
    // mapiranje naziva property koji se primaju ili salju. Ukoliko se samo pojedini property razlikuju njih
    // navesti u cemu je razlika, a svi ostali moraju biti nabrojani.
    // primer: Json format stize ' media_type ', mi u aplikaciji smo property nazvali mediaType, u tom slucaju
    // prmienjujemo CodingKey u suprotnom ukoliko nazivi nisu isti nece moci da radi enkodovanje/kodovanje
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}



let newsJSON = jsonNews1.data(using: .utf8)

if let data = newsJSON, let news = try? decoder.decode(News.self, from: data){
    print("\n", "============================= NEWS ============================", "\n")
    print(news)
}


// zadatak DECODE  objekta kojem su propertu objekat i niz

let weatherJSON1 =  """

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

let jsonDataWeather = weatherJSON1.data(using: .utf8)

if let data = jsonDataWeather, let weather = try? decoder.decode(WeatherWithLocation.self, from: data){
    print("\n", "============================= Weather ============================", "\n")
    print(weather)
}


// primer JSON-a sa neta uraditi DECODE

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
    "residents": [""],
    "films": [
        "http://swapi.dev/api/films/1/"
    ],
    "created": "2014-12-10T11:37:19.144000Z",
    "edited": "2014-12-20T20:58:18.421000Z",
    "url": "http://swapi.dev/api/planets/3/"
}
"""

struct Planet: Codable {
    var name: String
//    var rotation_period: String
//    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
//    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
//    var created: String
//    var edited: String
    var url: String
    
    func description() -> String{
        return "My name is \(name)"
    }
}

//enum CodingKeys: String, CodingKey{
//    case name
//    case rotationPeriod = "rotation_period"
//    case orbitalPeriod = "orbital_period"
//    case diameter
//    case climate
//    case gravity
//    case terrain
//    case surfaceWater = "surface_water"
//    case population
//    case residents
//    case films
//    case created
//    case edited
//    case url
//}

let planetFromStarWars = starWarsPlanet3.data(using: .utf8)

let newDecoder = JSONDecoder()

if let jsonData = planetFromStarWars, let planet = try? decoder.decode(Planet.self, from: jsonData){
    print("\n", "============================= Star Wars ============================", "\n")
    print(planet)
    print(planet.description())
}


//    let planet = try? newDecoder.decode(Planet.self, from: planetFromStarWars!)
//    print("\n", "============================= Star Wars 2 ============================", "\n")
//    print(planet!)
//    print(planet!.description())
   

