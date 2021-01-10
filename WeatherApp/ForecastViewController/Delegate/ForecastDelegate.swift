//
//  ForecastDelegate.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/30/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastDelegate: NSObject {
    unowned var parentVC: ForecastViewController
    init(with parent: ForecastViewController) {
        self.parentVC = parent
    }

}

//MARK:- Location Manager Delegate
extension ForecastDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: (location)")
            
            if let lat = locations.first?.coordinate.latitude, let lon = locations.first?.coordinate.longitude {
                parentVC.loadForecast(lat: lat, lon: lon)
            }
        
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
    
        case .notDetermined, .denied:
            print("location error denied")
            
            showAlertMessage(title: "Location Denied!", message: "Location access needed, to get weather forecast according to your location.", controller: parentVC)
            
        default:
            break
        }
        
    }

    
}

//MARK:- TableView Delegate

extension ForecastDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        view.autoresizingMask = .flexibleWidth
        
        let topLine = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0.5))
        topLine.autoresizingMask = .flexibleWidth
        view.addSubview(topLine)
        let downLine = UIView(frame: CGRect(x: 0, y: view.frame.size.height - 0.5, width: tableView.frame.size.width, height: 0.5))
        downLine.autoresizingMask = .flexibleWidth
        view.addSubview(downLine)
        
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: 150, height: 20))
        label.text = parentVC.keys[section]
        label.textColor = hexColor(hex: "#040205")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        if parentVC.isDark {
            view.backgroundColor = hexColor(hex: "#2F2D31")
            label.textColor = hexColor(hex: "#FAF8FB")
            topLine.backgroundColor = hexColor(hex: "#626064")
            downLine.backgroundColor = hexColor(hex: "#626064")
        } else { // #DDDDDE
            topLine.backgroundColor = hexColor(hex: "#DDDDDE")
            downLine.backgroundColor = hexColor(hex: "#DDDDDE")
            view.backgroundColor = .white
        }
        view.addSubview(label)

        return view
        
    }
}
