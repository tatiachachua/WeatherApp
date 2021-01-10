//
//  Weather.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/31/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import Foundation

class WeatherForecast {
    let date: Date?
    let dateString: String!
    let description: String!
    let temperature: Double!
    let icon: String?
    
    init(date: Date?, dateString: String, description: String, temperature: Double, icon: String?) {
        self.date = date
        self.dateString = dateString
        self.description = description
        self.temperature = temperature
        self.icon = icon
    }
    
    
    static func downloadWeatherForecast(lat: Double, lon: Double, completion: @escaping (Error?, [WeatherForecast]?) -> Void) {
        
        let url = URL(string:  "https:api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=5ce6f2fc72ace68b4ca1bbac8b6fbbee")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
           // 5ce6f2fc72ace68b4ca1bbac8b6fbbee
            if let error = error {
                print(error)
                completion(error, nil)
            }
              
            guard let data = data else { return }
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
              
                if let weatherList = dict["list"] as? [[String: AnyObject]] {
                    print(weatherList)
                    
                    var forecastList = [WeatherForecast]()
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
                    
                    for weather in weatherList {
                        var temperature: Double?
                        var description: String?
                        var dateString: String?
                        var icon: String?
                        
                        if let dateStr = weather["dt_txt"] as? String {
                            dateString = dateStr
                        }
                        if let main = weather["main"] as? [String: AnyObject] {
                            if let temp = main["temp"] as? Double {
                                temperature = temp
                            }
                        }
                        if let main = weather["weather"] as? [[String : AnyObject]] {
                            if let descriptionString = main[0]["description"] as? String {
                                description = descriptionString
                            }
                            if let iconString = main[0]["icon"] as? String {
                                icon = iconString
                            }
                        }
                        if temperature != nil, description != nil, icon != nil, dateString != nil {
                            if let date = dateFormatter.date(from: dateString!) {
                                let newWeather = WeatherForecast(date: date, dateString: dateString!, description: description!, temperature: temperature!, icon: icon)
                                forecastList.append(newWeather)
                            }
                        }
        
                    }
                
                    completion(nil, forecastList)
                    
                } 
             
            } catch let error as NSError{
                print(error)
                
                completion(error, nil)
            }
        }
        task.resume()
    }
    
    
    
   
    
}
