//
//  Constans.swift
//  WeatherTracker
//
//  Created by Ruchira Bandara on 5/18/22.
//

import Foundation

struct weatherStrings {
    static let addCityAlertHeader = "No Any City"
    static let addCityAlertMassage = "Please enter city name before click the button"
    static let addCityAlertCancelBTNTitle = "Cancel"
    
    struct APICAllError {
        static let  error1 = "Whoops, and error occured!"
        static let  error2 = "faild to decode object..."
    }
    
    struct APILink {
        static let LinkPart1 = "https://api.openweathermap.org/data/2.5/weather?q="
        static let LinkPart2 = "&units=metric&appid=4efd88605b7dea12565375f4c3d29318"
    }
}
    
