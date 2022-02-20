//
//  NetworkManager.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    let imageCache = NSCache<NSString, NSData>()
    
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
    
    func getCategories(completion: @escaping ([Category]?) -> Void ) {
        let path = "/categories/"
        
        let url = createURL(path: path)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let categories = try? JSONDecoder().decode([Category].self, from: data)
            categories == nil ? completion(nil) : completion(categories)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
    }
}
