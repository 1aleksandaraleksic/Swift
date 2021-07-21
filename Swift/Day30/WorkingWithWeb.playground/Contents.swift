import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct PhotoInfo: Codable{
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey{
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

//let url = URL(string: "https://www.apple.com")!
//
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    if let data = data,
//       let string = String(data: data, encoding: String.Encoding.utf8){
//        print(string)
////        print(data as NSData)
//    }
//
////    if let response = response {
////        print(response)
////    }
////    if let error = error{
////        print(error)
////    }
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()

//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//
//extension URL{
//    func withQueries(_ queries: [String: String]) -> URL?{
//        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
//        components!.queryItems = queries.map{
//            URLQueryItem(name: $0.0, value: $0.1)
//        }
//        return components!.url
//    }
//}
//
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    if let data = data,
//       let string = String(data: data, encoding: String.Encoding.utf8){
//        print(string)
//    }
//
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()


//let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
//let query: [String : String] = ["api_key" : "DEMO_KEY"]


extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components!.queryItems = queries.map{
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components!.url
    }
}

//let url = baseUrl.withQueries(query)!
//
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    let jsonDecoder = JSONDecoder()
//    if let data = data,
//       let photoDictonary = try? jsonDecoder.decode([String : String].self, from: data){
//       let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data){
//            print(photoInfo)
//       }
//
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()


func fetchPhotoInfo(completion: @escaping (PhotoInfo) -> Void ){
    print("pozvana funkcija")
    let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query: [String : String] = ["api_key" : "DEMO_KEY"]
    
    let url = baseUrl.withQueries(query)!

    let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
        print("usao u task")
        if let data = data,
           let photoInfo = try? JSONDecoder().decode(PhotoInfo.self, from: data){
            print("usao u if")
                print(photoInfo)
            completion(photoInfo)
//                return completion(photoInfo)
//            fetchPhotoInfo(completion: )
           }
        
        PlaygroundPage.current.finishExecution()
    }

    task.resume()

}

fetchPhotoInfo{ fetchedInfo in
    print("bilo sta")
 print(fetchedInfo)
}


//func performLongRunningOperation(completion: @escaping () -> Void){
//    //code that performas a long running operation
//    completion()
//}

//func performLongRunningOperation(completion: @escaping (String, Int, Data) -> Void){
//    completion(result, code, data)
//}
