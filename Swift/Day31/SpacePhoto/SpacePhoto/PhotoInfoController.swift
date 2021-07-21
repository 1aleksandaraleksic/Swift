//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by aleksandar.aleksic on 6/8/21.
//

import Foundation

class PhotoInfoController{
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void ){
    //    print("pozvana funkcija")
        let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String : String] = ["api_key" : "DEMO_KEY"]
        
        let url = baseUrl.withQueries(query)!

        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let data = data, let photoInfo = try? JSONDecoder().decode(PhotoInfo.self, from: data){
                completion(photoInfo)
            }else{
                print("Data not found")
                completion(nil)
            }
            
        }
        task.resume()
    }
}
