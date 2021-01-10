//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 1/3/21.
//  Copyright © 2021 Tatia Chachua. All rights reserved.
//

import Foundation


class CurrentWeather {
    
    let description: String!
    let temperature: Double!
    let humidity: Int!
    let hPaPresure: Int!
    let speed: String!
    let direction: String!
    let icon: String!
    
    init(description: String!, temperature: Double, humidity: Int!, hPaPresure: Int, speed: String!, direction: String, icon: String!) {
       
        self.description = description
        self.temperature = temperature
        self.humidity = humidity
        self.hPaPresure = hPaPresure
        self.speed = speed
        self.direction = direction
        self.icon = icon
    }
    
    
    static func downloadCurrentWeather(lat: Double, lon: Double, completion: @escaping (Error?, CurrentWeather?) -> Void) {
        let url = URL(string:  "https:api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=5ce6f2fc72ace68b4ca1bbac8b6fbbee")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
           
            if let error = error {
                print(error)
                
                completion(error, nil)
            }
              
            guard let data = data else {
                
                return
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                
                var description: String!
                var temperature: Double!
                var humidity: Int!
                var hPaPresure: Int!
                var speed: String!
                var direction: String!
                var icon: String?
                
                if let wind = dict["wind"] as? [String: AnyObject] {
                    if let deg = wind["deg"] as? Int, let windSpeed = wind["speed"] as? Double {
                        let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
                        let index = Int((Double(deg) + 22.5) / 45.0) & 7
                        direction = directions[index]
                        
                        let speedString = "\(windSpeed) km/h"
                        speed = speedString
                    }
                }
                
                if let main = dict["main"] as? [String: AnyObject], let weather = dict["weather"] as? [[String: AnyObject]] {
                    print(main)
                    if let temp = main["temp"] as? Double, let humidityInt = main["humidity"] as? Int, let preasure = main["pressure"] as? Int {
                        temperature = temp
                        humidity = humidityInt
                        hPaPresure = preasure
                    }
                    if let weatherDescription = weather[0]["description"] as? String, let iconString = weather[0]["icon"] as? String {
                        description = weatherDescription.capitalized
                        icon = iconString
                    }
                }
                
                if description != nil, temperature != nil, humidity != nil, hPaPresure != nil, speed != nil, direction != nil, icon != nil {
                    let currentWeather = CurrentWeather(description: description, temperature: temperature, humidity: humidity, hPaPresure: hPaPresure, speed: speed, direction: direction, icon: icon)
                    
                    completion(nil, currentWeather)
                } 
              
            } catch let error as NSError{
                print(error)
                
                completion(error, nil)
            }
        }
        task.resume()
    }
    
    
    
   
}

