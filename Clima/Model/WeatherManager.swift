//
//  WeatherManager.swift
//  Clima
//
//  Created by Quang Nguyen on 13/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2faa572f645551b2834e8ecae68ae489&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the URLSession a task
            let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let saveData = data {
                    let dataString = String(data: saveData, encoding: .utf8)
                    print(dataString)
                }
            })
            //4. Start the task
            task.resume()
            
        }
    }

}
