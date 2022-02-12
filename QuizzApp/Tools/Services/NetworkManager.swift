//
//  NetworkManager.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    //MARK: - Functions
    
    func createURL(path: String) -> URL {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "quiz-app-restapi.herokuapp.com"
        components.path = path
        let queryItemToken = URLQueryItem(name: "format", value: "json")
        components.queryItems = [queryItemToken]
        
        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }
        
        return url
    }
}
