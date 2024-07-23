//
//  City.swift
//  EVAVIPER
//
//  Created by husayn on 22/07/2024.
//

import Foundation

struct City: Identifiable, Equatable{
    var id = UUID().uuidString
    let name: String
    let latitude: Double
    let longitude: Double
    var isLiked: Bool = false
    var temp: Double?
    
    mutating func updateTemp(temp:Double){
        self.temp = temp
    }
}


struct WeatherResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Double
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_units: Units
    let current: Current
}

struct Units: Decodable {
    let time: String
    let interval: String
    let temperature_2m: String
    let relative_humidity_2m: String
    let is_day: String?
    let rain: String
    let visibility: String
}

struct Current: Decodable {
    let time: String
    let interval: Int
    let temperature_2m: Double
    let relative_humidity_2m: Double
    let is_day: Int
    let rain: Double
    let visibility: Double
}
