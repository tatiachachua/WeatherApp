//
//  DataSource.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/31/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import Foundation
import UIKit

class ForecastDataSource: NSObject {
    unowned var parentVC: ForecastViewController
    init(with parent: ForecastViewController) {
        self.parentVC = parent
    }

}

extension ForecastDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        parentVC.weatherForecast[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.reuseIndentifier(), for: indexPath) as! ForecastTableViewCell
        
        let weather = parentVC.weatherForecast[indexPath.section][indexPath.row]
        
        if let icon = weather.icon {
            cell.loadImage(imageName: icon)
        }
        var temperature = String(format: "%.0f", weather.temperature - 273.15)
        if temperature.contains("-0") {
            temperature = "0"
        }
        cell.temperatureLabel.text = "\(temperature)°"
        cell.descriptionLabel.text = weather.description.capitalized
        
        let hour = weather.dateString.components(separatedBy: " ")[1].components(separatedBy: ":")
        cell.timeLabel.text = "\(hour[0]):\(hour[1])"
        
        if parentVC.isDark == true {
            
            cell.timeLabel.textColor = hexColor(hex: "#FAF8FB")
            cell.descriptionLabel.textColor = hexColor(hex: "#FAF8FB")
        } else {
            cell.timeLabel.textColor = hexColor(hex: "#040205")
            cell.descriptionLabel.textColor = hexColor(hex: "#040205")
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return parentVC.weatherForecast.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = parentVC.keys[section]
        
        return title
    }
    

}

