//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/30/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    //MARK:- Constants & Variables
    var locationManager = CLLocationManager()
    let weatherTableView = UITableView()
    var weatherForecast = [[WeatherForecast]]()
    var keys = [String]()
    let colorfulLine = ColorfulLine()
    
    private lazy var uiInitializer: ForecastUIInitializer = {
        let initializer = ForecastUIInitializer(with: self)
        return initializer
    }()
    
    lazy var dataSource: ForecastDataSource = {
        let source = ForecastDataSource(with: self)
        return source
    }()
    
    lazy var delegate: ForecastDelegate = {
        let delegate = ForecastDelegate(with: self)
        return delegate
    }()
    
    var isDark = false
    var constraints = [NSLayoutConstraint]()

    //MARK:- General Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        locationManager.delegate = delegate
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 300
        locationManager.requestLocation()

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.topItem?.title = "Meria, GE"
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                isDark = true
                self.view.backgroundColor = hexColor(hex: "#2F2D31")
                self.navigationController?.navigationBar.barTintColor = .black
            } else {
                self.view.backgroundColor = .white
                self.navigationController?.navigationBar.barTintColor = .white
            }
        } else {
            self.view.backgroundColor = .white
            self.navigationController?.navigationBar.barTintColor = .white
        }
        
        uiInitializer.setupSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        if UIDevice.current.orientation == .portrait {
            uiInitializer.updatFramesForPortrait()
        } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            uiInitializer.updatFramesForLandscape()
        }
    }
    
    //MARK:- Loading Weather Data
    func loadForecast(lat: Double, lon: Double) {
        WeatherForecast.downloadWeatherForecast(lat: lat, lon: lon) { (error, forecast) in
            if error != nil {
                print(error!)
                if Reachability.isConnectedToNetwork() {
                    showAlertMessage(title: "Could not load data!", message: error!.localizedDescription, controller: self)
                } else {
                    showAlertMessage(title: "No internet connectin!", message: error!.localizedDescription, controller: self)
                }
            } else {
                self.weatherForecast = self.sortWeatherByDate(weatheList: forecast!)
                DispatchQueue.main.async {
                    self.weatherTableView.reloadData()
                }
            }
        }
        
    }
    
    // Group weather data by days
    func sortWeatherByDate(weatheList: [WeatherForecast]) -> [[WeatherForecast]] {
        var sortedForecast = [[WeatherForecast]]()

        var group = [String: [WeatherForecast]]()
        for weather in weatheList {
            if let weekDay = getWeekDay(date: weather.dateString!) {

                if group[weekDay] == nil {
                    self.keys.append(weekDay)
                    group[weekDay] = [weather]
                    sortedForecast.append([weather])
                } else {
                    group[weekDay]?.append(weather)
                    sortedForecast[sortedForecast.count - 1].append(weather)
                }
                
            }
        }

        return sortedForecast
    }

    
}
