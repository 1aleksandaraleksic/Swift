//
//  Movie.swift
//  Enum
//
//  Created by aleksandar.aleksic on 5/26/21.
//

import Foundation

struct Movie{
    let title: String
    let year: Int
    let rated: Double
    let runTime: String
    let genre: Genre
    let director: String
    let writer: String
    let language: Language
    let country: Country
    let productionHouse: ProductionHouse
    let mainActor: String
    let image: String
}

enum Genre{
    case love, horror, action, sport, thriller, comedy, drama
}

func findGenre(_ movieGenre: String) -> Genre{
    switch movieGenre.lowercased() {
    case "love":
        return .love
    case "horror":
        return .horror
    case "action":
        return .action
    case "sport":
        return .sport
    case "thriller":
        return .thriller
    case "comedy":
        return .comedy
    case "drama":
        return .drama
    default:
        return .action
    }
}

enum Language{
    case English, German, Serbian, Italian, Spanish, French
}

func findLanguage(_ movieLanguage: String) -> Language{
    switch movieLanguage.uppercased() {
    case "ENG":
        return .English
    case "GER":
        return .German
    case "SRB":
        return .Serbian
    case "IT":
        return .Italian
    case "SP":
        return .Spanish
    case "FR":
        return .French
    default:
        return .English
    }
}

enum Country{
    case USA, UK, Spain, Portugal, Mexico, France, Germany, Italy
}

func findCountry(_ movieCountry: String) -> Country{
    switch movieCountry {
    case "USA":
        return .USA
    case "UK":
        return .UK
    case "Spain":
        return .Spain
    case "Portugal":
        return .Portugal
    case "Mexico":
        return .Mexico
    case "France":
        return .France
    case "Germany":
        return .Germany
    case "Italy":
        return .Italy
    default:
        return .USA
    }
}

enum ProductionHouse: String{
    case columbiaP = "Columbia Pictures"
    case warrnerB = "Warrner Bros."
    case universalP = "Universal Pictures"
}

func findProductionHouse(_ movieProductionHouse: String) -> ProductionHouse{
    switch movieProductionHouse {
    case "Columbia Pictures", "cp":
        return .columbiaP
    case "Warrner Bros.":
        return .warrnerB
    case "Universal Pictures":
        return .universalP
    default:
        return .universalP
    }
}
