//
//  Currently.swift
//  weather
//
//  Created by Jamie Chu on 3/30/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import Foundation

struct Currently : Codable {
    let temperature: Float
    let precipProbability: Float
}

struct RootWeather : Codable {
    let currently: Currently
}
