//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/30/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let todayViewController = UINavigationController(rootViewController: TodayViewController())
        todayViewController.title = "Today"

        let forecastViewController = UINavigationController(rootViewController: ForecastViewController())
        forecastViewController.title = "Forecast"

        let tabBarList = [todayViewController, forecastViewController]

        viewControllers = tabBarList
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                UITabBar.appearance().barTintColor = UIColor.black
            } else {
                UITabBar.appearance().barTintColor = UIColor.white
            }
        } else {
            UITabBar.appearance().barTintColor = UIColor.white
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.gray]
        
    }


}

