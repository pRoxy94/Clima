//
//  WeatherManager.swift
//  Clima
//
//  Created by Rossana Laricchia on 10/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct Weathermanager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6d22216b13aee6ca7e2e78e9063392a2&units=metric"
    
    func fetchWeather(cityName: String) {
	   let urlString = "\(weatherURL)&q=\(cityName)"
	   performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
	   // 1. Create a URL
	   if let url = URL(string: urlString) {
		  // 2. Create a URLSession
		  let session = URLSession(configuration: .default)
		  // 3. Give the session a task
		  let task = session.dataTask(with: url, completionHandler: handle(data:responde:error:))
		  // 4. Start the task
		  task.resume()
	   }
    }
    
    func handle(data: Data?, responde: URLResponse?, error: Error?) {
	   if error != nil {
		  print(error!)
		  return
	   }
	   
	   if let safeData = data {
		  let dataString = String(data: safeData, encoding: .utf8)
		  print(dataString)
	   }
    }
}
