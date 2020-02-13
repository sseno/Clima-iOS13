//
//  WeatherData.swift
//  Clima
//
//  Created by Rohmat Suseno on 13/02/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}

struct Main: Codable {
    let temp: Double
}
