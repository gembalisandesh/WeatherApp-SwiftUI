//
//  NetworkManager.swift
//  WeatherApp-SwiftUI
//
//  Created by Gembali Sandesh Kumar on 07/01/24.
//

import Foundation

struct API {
    
    static let key = "9898f76611dba534c9d721073a297ccf"
}

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"

    static func getURLFor(lat: Double, lon: Double) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}


final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                
                completion(.failure(.invalidData))
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            
            } catch let err {
                
                print(String(describing: err))
                completion(.failure(.decodinError(err: err.localizedDescription)))
            }
        }
        .resume()
    }
}


enum NetworkError: Error {
    
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodinError(err: String)
}

