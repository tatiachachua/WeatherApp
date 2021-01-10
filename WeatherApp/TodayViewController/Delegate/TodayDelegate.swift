//
//  ForecastDelegate.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/30/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit
import CoreLocation

class TodayDelegate: NSObject {
    unowned var parentVC: TodayViewController
    init(with parent: TodayViewController) {
        self.parentVC = parent
    }

}

//MARK:- Location Manager Delegate
extension TodayDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: (location)")
            
            if let lat = locations.first?.coordinate.latitude, let lon = locations.first?.coordinate.longitude {
                parentVC.loadCurrentWeather(lat: lat, lon: lon)
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
