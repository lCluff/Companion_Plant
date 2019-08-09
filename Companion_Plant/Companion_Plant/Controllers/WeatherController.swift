//
//  WeatherController.swift
//  Companion_Plant
//
//  Created by Leah Cluff on 8/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class WeatherController {
    
    static let sharedInstance = WeatherController()
    var weatherForecastArray: [Weather] = []
    
    func fetchWeather(searchTerm: String, completion: @escaping(Weather?) -> Void) {
        
        guard let API_URL = URL(string:  "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=95ccca4da7ebdf679513398dcfbe690d")
            else { return }
        print(API_URL)
        let dataTask = URLSession.shared.dataTask(with: API_URL) { (data, _, error) in
            if let error = error {
                print("Oh h*ck, there was an error pulling the current weather \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return}
            let decoder = JSONDecoder()
            
            do {
                let weatherForecastArray = try decoder.decode([Weather].self, from: data)
                print(weatherForecastArray.count)
                self.weatherForecastArray = weatherForecastArray
                completion(weatherForecastArray.first)
            } catch {
                print(error)
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
    
    func fetchWeatherForecast(searchTerm: String, completion: @escaping(Weather?) -> Void) {
        guard let FORECAST_API_URL = URL(string:  "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=8&appid=95ccca4da7ebdf679513398dcfbe690d")
            else {return}
        print(FORECAST_API_URL)
        let dataTask = URLSession.shared.dataTask(with: FORECAST_API_URL) { (data, _, error) in
            if let error = error {
                print("Oh h*ck, there was an error pulling the current weather \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return}
            let decoder = JSONDecoder()
            
            do {
                let weatherForecastArray = try decoder.decode([Weather].self, from: data)
                print(weatherForecastArray.count)
                self.weatherForecastArray = weatherForecastArray
                completion(weatherForecastArray.first)
                
            }catch {
                print(error)
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
}
