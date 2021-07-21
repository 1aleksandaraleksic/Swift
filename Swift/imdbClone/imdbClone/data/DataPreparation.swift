//
//  DataPreparation.swift
//  IMDb - clone
//
//  Created by aleksandar.aleksic on 6/15/21.
//

import Foundation
import UIKit

class DataPreparation{
    
    public static var listMoviesInTranding: SearchMovies?
    public static var listWhatToWatchMovie: SearchMovies?
    public static var listTopPicksForYou: SearchMovies?
    public static var listFanFavorite: SearchMovies?
    public static var listExplorePrime: SearchMovies?
    public static var listComingSoon: SearchMovies?
    public static var listWatchSoonAtHome: SearchMovies?

    static let baseUrlOmdb = "http://omdbapi.com/"
    static let apiKeyOmdb = "2d1f01c0"
    
    static func createURLForMovie() -> String{
//        return "http://www.omdbapi.com/?apikey=2d1f01c0&i=tt3554046"
        return "http://www.omdbapi.com/?apikey=2d1f01c0&s=Superman"
    }
    
    static func fetchMovie(url: String, completion: @escaping (SearchMovies?) -> Void){
       
        guard let myURL = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: myURL){ (data,response,error) in
            if let data = data, case let movies = try? JSONDecoder().decode(SearchMovies.self, from: data){
                completion(movies)
            }
        }
        task.resume()
    }
    
    static func fetchMovieBoxOffice(url: String, completion: @escaping (MovieBoxOffice?) -> Void){
       
        guard let myURL = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: myURL){ (data,response,error) in
            if let data = data, case let movie = try? JSONDecoder().decode(MovieBoxOffice.self, from: data){
                completion(movie)
            }
        }
        task.resume()
    }
    
    
}
