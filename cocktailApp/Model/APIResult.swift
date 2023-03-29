//
//  APIResult.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-12.
//

import Foundation

struct ApiResult: Decodable {
    
    var list: [Forecast]
    
}

struct Forecast: Decodable {
    var name: String
    var dt: Int
    var main: Main
    var weather: [Weather]
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

