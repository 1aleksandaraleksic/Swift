//
//  URL+Helpers.swift
//  imdbClone
//
//  Created by aleksandar.aleksic on 6/17/21.
//

import Foundation

extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components!.queryItems = queries.map{
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components!.url
    }
    
    func withHTTPS() -> URL!{
        var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        component?.scheme = "https"
        return component?.url
    }
}
