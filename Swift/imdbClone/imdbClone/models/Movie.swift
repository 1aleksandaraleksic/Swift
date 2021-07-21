//
//  Movie.swift
//  IMDb - clone
//
//  Created by aleksandar.aleksic on 6/15/21.
//

import Foundation

struct Search: Codable{
    var title: String
    var year: String
    var imdbID: String
    var poster: String
    var type: String
    
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case poster = "Poster"
            case year = "Year"
            case imdbID
            case type = "Type"
        }
}

struct SearchMovies: Codable{
   var Search: [Search]
    var totalResults: String
    var Response: String
}


struct Movie: Codable{
    var title: String
    var year: String
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var poster: String
    var ratings: [Rating]
    var metascore: String
    var imdbRating: String
    var imdbVotes: String
    var imdbID: String
    var type: String
    var dvd: String
    var boxOffice: String
    var production: String
    var website: String
    var response: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer =  "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }

}

struct Rating: Codable {
    let source: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

struct MovieBoxOffice: Codable{
    var title: String?
    var boxOffice: String?
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case boxOffice = "BoxOffice"
    }
}

