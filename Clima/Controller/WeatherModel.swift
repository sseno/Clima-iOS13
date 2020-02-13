//
//  WeatherModel.swift
//  Clima
//
//  Created by Rohmat Suseno on 13/02/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    // computed properties
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...504:
            return "cloud.sun.rain"
        case 511:
            return "snow"
        case 520...531:
            return "cloud.drizzle"
        case 600...622:
            return "snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801:
            return "cloud.sun"
        case 802:
            return "cloud"
        case 803...804:
            return "smoke"
        default:
            return "cloud"
        }
    }
}
