//
//  ManageData.swift
//  StarWarsPlanet
//
//  Created by aleksandar.aleksic on 6/4/21.
//

import Foundation

class ManageData{
    
    static var dataArray = [Planet]()
    static var selectedPlanet: Planet?
    static var preparedDetailPlanetToShow: Dictionary<Int, [String]> = [:]
    static var filmsForSelectedPlanet: Dictionary<Int, [String]> = [:]
    static var residentsForSelectedPlanet: Dictionary<Int, [String]> = [:]
    
    static let planetDetailDescription: [String] = ["name", "rotation period", "orbital period", "diameter", "climate", "gravity", "terrain", "surface water", "population", "residents", "films", "created", "edited", "url"]
    
    static var nextPlanetList: [String : String]? = ["" : ""]
    
    static func prepereDetailForPlanet(planetName: String, planetData: Int) -> Bool{
        preparedDetailPlanetToShow = [ : ]
//        filmsForSelectedPlanet = [ : ]
        
            for planet in dataArray{
                if planet.name == planetName{
                    if planetData == 0 || planetData == 1 || planetData == 2{
                        
                        preparedDetailPlanetToShow[0] = [planetDetailDescription[1], planet.rotation_period]
                        preparedDetailPlanetToShow[1] = [planetDetailDescription[2], planet.orbital_period]
                        preparedDetailPlanetToShow[2] = [planetDetailDescription[3], planet.diameter]
                        preparedDetailPlanetToShow[3] = [planetDetailDescription[4], planet.climate]
                        preparedDetailPlanetToShow[4] = [planetDetailDescription[5], planet.gravity]
                        preparedDetailPlanetToShow[5] = [planetDetailDescription[6], planet.terrain]
                        preparedDetailPlanetToShow[6] = [planetDetailDescription[7], planet.surface_water]
                        preparedDetailPlanetToShow[7] = [planetDetailDescription[8], planet.population]
                        
                        //ako je vec jednom dovukao filmove ne mora opet
                        for (i, film) in planet.films.enumerated(){
                            fetchDataMovie(url: film, completion: {(movie) in
                                guard let movie = movie else { return }
                                print("dodaje film \(movie.title)")
                                filmsForSelectedPlanet[i] = [planetDetailDescription[10], movie.title]
                            })
                        }
                        
                        for (i, resident) in planet.residents.enumerated(){
                            fetchDataPeople(url: resident) { (people) in
                                guard let people = people else { return }
                                print("dodaje ljude \(people.name)")
                                residentsForSelectedPlanet[i] = ["nesto", people.name]
                            }
                        }
                        return true
                    }
                }
            }
        return false
    }
    
    
    static func fetchDataMovie(url: String, completion: @escaping (Film?) -> Void){
        let task = URLSession.shared.dataTask(with: URL(string: url)!){ (data,response,error) in
            if let data = data, let movie = try? JSONDecoder().decode(Film.self, from: data){
                completion(movie)
            }
        }
        task.resume()
    }
    
    static func fetchDataPeople(url: String, completion: @escaping (People?) -> Void){
        let task = URLSession.shared.dataTask(with: URL(string: url)!){ (data,response,error) in
            if let data = data, let people = try? JSONDecoder().decode(People.self, from: data){
                completion(people)
            }
        }
        task.resume()
    }
    
    static func fetchListOfPlanet(query: [String : String]?, completion: @escaping (PlanetList?) -> Void){
        var url = URL(string: "https://swapi.dev/api/planets/")
        
        if let query = query {
            url = url?.withQueries(query)
        }
        
        let task = URLSession.shared.dataTask(with: url!){ data, response, error in
            if let data = data, case let planets = try? JSONDecoder().decode(PlanetList.self, from: data){
                completion(planets)
            }
        }
        
        task.resume()
    }
    
    static func fetchPlanetList() -> Bool{
        if let loadPlanetListPage = nextPlanetList {
            ManageData.fetchListOfPlanet(query: loadPlanetListPage){ (planets) in
                
                guard let planets = planets else{ return }
                
                if let next = planets.next{
                    nextPlanetList = ["page" : String(next.last!)]
                }else{
                    nextPlanetList = nil
                }
                
                for planet in planets.results{
                    ManageData.dataArray.append(planet)
                }
            }
            return true
        }
        return false
    }
    
}
