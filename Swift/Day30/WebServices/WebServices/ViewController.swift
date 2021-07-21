//
//  ViewController.swift
//  WebServices
//
//  Created by aleksandar.aleksic on 6/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://swapi.dev/api/")!
    var task: URLSessionTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = URLSession.shared.dataTask(with: url){ (data,response, error) in
            
            if let data = data, let s = String(data:data,encoding: String.Encoding.utf8) {
                print(s)
            }
            
            
        }
    }
    
    
    @IBAction func fetchData(_ sender: Any) {
        getData()
    }
    
    func getData() {
        task.resume()
    }
    
}

