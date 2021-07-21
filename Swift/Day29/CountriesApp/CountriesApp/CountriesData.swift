//
//  CountriesData.swift
//  CountriesApp
//
//  Created by aleksandar.aleksic on 6/4/21.
//

import Foundation

class CountriesData{
    
    static var dataArray = [String]()
    static var filteredDataArray = [String]()
    
    static func loadListOfCountries(fileName: String, fileExtension: String){
        
        let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        let fileExist = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        if let fileContent = fileExist{
            
            let lineByLineArray = fileContent.split(separator: "\n")
            
            for row in lineByLineArray{
                let country = String(row)
                
                dataArray.append(country)
            }
        }
        filteredDataArray = dataArray
    }
    
}
