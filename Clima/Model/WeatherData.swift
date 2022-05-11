//
//  WeatherData.swift
//  Clima
//
//  Created by Rossana Laricchia on 11/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

/**
 Decodable: a type that can decode itself from an external representation
 */
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
