//
//  ForecastUIInitializer.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/31/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import Foundation
import UIKit

class ForecastUIInitializer: NSObject {
    
    unowned var parentVC: ForecastViewController
    init(with parent: ForecastViewController) {
        self.parentVC = parent
    }

    
    func setupSubviews() {
        
        let topY = parentVC.navigationController?.navigationBar.frame.maxY ?? 0
        
        parentVC.colorfulLine.frame = CGRect(x: 0, y: (topY), width: parentVC.view.frame.size.width, height: 3)
        parentVC.view.addSubview(parentVC.colorfulLine)

        parentVC.weatherTableView.frame = CGRect(x: 0, y: parentVC.colorfulLine.frame.maxY, width: parentVC.view.frame.size.width, height: parentVC.view.frame.size.height - topY - parentVC.colorfulLine.frame.size.height)
        parentVC.weatherTableView.dataSource = parentVC.dataSource
        parentVC.weatherTableView.delegate = parentVC.delegate
        parentVC.weatherTableView.rowHeight = 70
        parentVC.weatherTableView.sectionHeaderHeight = 40
        parentVC.weatherTableView.separatorInset = UIEdgeInsets(top: 0, left: 82, bottom: 0, right: 0)
        parentVC.weatherTableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseIndentifier())
        parentVC.view.addSubview(parentVC.weatherTableView)
        parentVC.weatherTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        if parentVC.isDark == true {
            parentVC.weatherTableView.backgroundColor = hexColor(hex: "#2F2D31")
            parentVC.weatherTableView.separatorColor = hexColor(hex: "#626064")
        }
    }
    
    func updatFramesForPortrait() {
        
        let topY = parentVC.navigationController?.navigationBar.frame.maxY ?? 0
        
        parentVC.colorfulLine.frame = CGRect(x: 0, y: (topY), width: parentVC.view.frame.size.width, height: 3)
        parentVC.weatherTableView.frame = CGRect(x: 0, y: parentVC.colorfulLine.frame.maxY, width: parentVC.view.frame.size.width, height: parentVC.view.frame.size.height - topY - parentVC.colorfulLine.frame.size.height)
    }
    
    func updatFramesForLandscape() {
        let left = parentVC.view.safeAreaInsets.left
        let right = parentVC.view.safeAreaInsets.right

        let topY = parentVC.navigationController?.navigationBar.frame.maxY ?? 0

        parentVC.colorfulLine.frame = CGRect(x: 0, y: (topY), width: parentVC.view.frame.size.width, height: 3)
        parentVC.weatherTableView.frame = CGRect(x: left, y: parentVC.colorfulLine.frame.maxY, width: parentVC.view.frame.size.width - left - right, height: parentVC.view.frame.size.height - topY - parentVC.colorfulLine.frame.size.height)
        
    }
    
    
}
