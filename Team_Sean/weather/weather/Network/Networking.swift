//
//  Networking.swift
//  weather
//
//  Created by Jamie Chu on 3/30/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case malformedURL
    case deserialization
    case noData
    case noResponse
    case badResponseCode(Int)
    case clientSide(Error)
}

final class Networking {
    
    enum HTTPMethod: String {
        case get
        case post
        case patch
        case put
        case delete
        case options
        case head
        case trace
        case connect
    }
    
    // NOTE: - static functions are a bit of a code smell, should architect differently if we want to scale
    static func getWeather(request: EndpointRouter, completion: @escaping (FetchResult<RootWeather, NetworkErrors>) -> Void) {
        
        guard let request = request.asURLRequest else { return }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let sessionTuple = (data, response, error)
            let result = HTTPResponseValidator<RootWeather, NetworkErrors>(sessionTuple: sessionTuple).validationResult
            
            completion(result)
        }.resume()
    }
}

extension Networking.HTTPMethod {
    var stringValue: String {
        return rawValue.uppercased()
    }
}
