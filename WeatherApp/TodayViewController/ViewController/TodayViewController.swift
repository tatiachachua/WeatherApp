//
//  TodayViewController.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/30/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit
import MapKit

class TodayViewController: UIViewController {

    //MARK:- Constants & Variables
    var currentWeather: CurrentWeather!
    
    let dayIcon = UIImageView()
    let titleLabel = UILabel()
    let weatherInfoLab = UILabel()
    
    let colorfulLine = ColorfulLine()
    var topLine: TopDotLine!
    var bottomLine: BottomDotLine!
    
    let containerView = UIView()
    let humidityIcon = UIImageView()
    let humidityLabel = UILabel()
    
    let dropIcon = UIImageView()
    let dropLabel = UILabel()
    
    let hpaIcon = UIImageView()
    let hpaLabel = UILabel()
    
    let speedIcon = UIImageView()
    let speedLabel = UILabel()
    
    let directionIcon = UIImageView()
    let directionLabel = UILabel()
    let shareButton = UIButton()
    
    var locationManager = CLLocationManager()
    
    var isDark = false
    
    var constraints = [NSLayoutConstraint]()
    
    private lazy var uiInitializer: CurrentWeatherUIInitializer = {
        let initializer = CurrentWeatherUIInitializer(with: self)
        return initializer
    }()
    
    lazy var delegate: TodayDelegate = {
        let delegate = TodayDelegate(with: self)
        return delegate
    }()
    
    
    //MARK:- General Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.isDark = true
                self.view.backgroundColor = hexColor(hex: "#2F2D31")
                self.navigationController?.navigationBar.tintColor = .darkGray
                self.navigationController?.navigationBar.barTintColor = .black
            } else {
                self.view.backgroundColor = .white
                self.navigationController?.navigationBar.tintColor = .white
                self.navigationController?.navigationBar.barTintColor = .white
            }
        } else {
            self.view.backgroundColor = .white
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.barTintColor = .white
        }
        
        locationManager.delegate = delegate
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 300
        locationManager.requestLocation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.topItem?.title = "Today"
        uiInitializer.setupSubviews()
        
    }
    

    override func viewWillLayoutSubviews() {
        if UIDevice.current.orientation == .portrait {
            uiInitializer.updatConstraintsForPortrait()
        } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            uiInitializer.updatConsraintstForLandscape()
        }
    }
    


    //MARK:- Current Weather Loading Function
    func loadCurrentWeather(lat: Double, lon: Double) {
        CurrentWeather.downloadCurrentWeather(lat: lat, lon: lon) { (error, weather) in
            if error != nil {
                print(error!)
                if Reachability.isConnectedToNetwork() {
                    showAlertMessage(title: "Could not load data!", message: error!.localizedDescription, controller: self)
                } else {
                    showAlertMessage(title: "No internet connectin!", message: error!.localizedDescription, controller: self)
                }
            } else {
                self.currentWeather = weather
                DispatchQueue.main.async {
           
                    // Load icon
                    if let icon = self.currentWeather.icon {
                        if let url = URL(string:  "http://openweathermap.org/img/wn/\(icon).png") {
                            let data = try? Data(contentsOf: url)
                            self.dayIcon.image = UIImage(data: data!)
                        }
                    }
                    let temperature = String(format: "%.0f", self.currentWeather.temperature - 273.15)
                    self.weatherInfoLab.text = "\(temperature.capitalized)° | \(self.currentWeather.description!)"
                    self.humidityLabel.text = "\(self.currentWeather.humidity!)%"
                    self.hpaLabel.text = "\(self.currentWeather.hPaPresure!) hPa"
                    self.speedLabel.text = self.currentWeather.speed
                    self.directionLabel.text = self.currentWeather.direction
                }
            }
        }
        
    }
    
    
    //MARK:- Share Action
    @objc func shareButtonPressed() {
        print("share pressed" )
        
        if let weatherInfo = self.weatherInfoLab.text {
            let shareString = "\(weatherInfo), Meria, by WeatherApp"
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [shareString], applicationActivities: nil)
            let currentViewController:UIViewController = UIApplication.shared.keyWindow!.rootViewController!

            currentViewController.present(activityViewController, animated: true, completion: nil)
        }
        
        
        
    }
    

    
}
