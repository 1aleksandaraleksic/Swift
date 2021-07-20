//
//  DataPreparation.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 2.7.21..
//

import Foundation
import UIKit

class DataPreparation{
    
    static let url = "http://mobileapp-coll.engds.it/AudiEventi/langs/it_IT.json"
    
    static func fetchLangs(url: String, completion: @escaping (Langs?) -> Void){
        
        guard let apiURL = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: apiURL){ (data, response, error) in
            if let error = error {
                print("Error accesing AudiEventi Api: \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with response, uninspected status code: \(String(describing: response))")
                return
                
            }
            
            if let data = data, case let langs = try? JSONDecoder().decode(Langs.self, from: data){
                completion(langs)
            }
        }
        task.resume()
    }
    
    


    
}
