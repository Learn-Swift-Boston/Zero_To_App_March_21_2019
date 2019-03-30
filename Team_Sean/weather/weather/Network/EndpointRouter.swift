//
//  EndpointRouter.swift
//  weather
//
//  Created by Jamie Chu on 3/30/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import Foundation

protocol APIClient {
    func fetch()
}

protocol EndpointRouter {
    
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    
    var parameters: [String: Any]? { get }
    var httpHeaders: [String: Any]? { get }
    var method: Networking.HTTPMethod { get }
}


extension EndpointRouter  {
    var asURLRequest: URLRequest? {
        guard let url = url else { return nil }
        
        var aa = URLRequest(url: url)
        aa.httpMethod = method.rawValue

        if let httpHeaders = httpHeaders {
            httpHeaders.forEach { header in
                guard let value = header.value as? String else { return }
                aa.setValue(value, forHTTPHeaderField: header.key)
            }
        }
        
        return URLRequest(url: url)
    }
    
    // MARK: - Helpers
    private var url: URL? {
        var components = URLComponents.init()
        components.host = host
        components.scheme = scheme
        components.path = path
        return components.url
    }
}

// MARK: - default implementation
extension EndpointRouter {
    var host: String {
        return "api.darksky.net"
    }
    var scheme: String {
        return Constants.Networking.https
    }
    var path: String {
        return "/forecast/76b2f04f15f3d423a1f4a097079e9b19/42.3140089,71.2504676"
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    var httpHeaders: [String: Any]? {
        return nil
    }
    var method: Networking.HTTPMethod {
        return .get
    }
}
