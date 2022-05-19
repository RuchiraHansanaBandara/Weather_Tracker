//
//  Weather.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/17/22.
//

import Foundation


protocol weatherData {
    func didFetchWeatherData(_ weather: Weather)
}




struct Weather: Decodable {

    var name: String
    var main: Main
    
    struct Main: Decodable {
        var temp: Double
        var tempMin: Double
        var tempMax: Double
        var humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case humidity
        }
    }
    
}

