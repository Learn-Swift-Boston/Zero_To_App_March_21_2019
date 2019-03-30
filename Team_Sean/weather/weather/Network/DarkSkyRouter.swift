//
//  DarkSkyRouter.swift
//  weather
//
//  Created by Jamie Chu on 3/30/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import Foundation

enum DarkSkyRouter: EndpointRouter {
    case basic

    var host: String {
        switch self {
        case .basic:
            return "api.darksky.net"
        }
    }
    
    var scheme: String {
        switch self {
        case .basic:
            return Constants.Networking.https
        }

    }
    
    var path: String {
        switch self {
        case .basic:
            return "/forecast/76b2f04f15f3d423a1f4a097079e9b19/42.3140089,71.2504676"
        }
    }
        
    // MARK: add your api key here in a dictionary
    var httpHeaders: [String : Any]? {
        switch self {
        case .basic:
            return [:]
        }
    }
}
