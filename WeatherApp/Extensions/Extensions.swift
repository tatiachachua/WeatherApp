//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/31/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import Foundation
import UIKit


//MARK:- Show Alert
public func showAlertMessage(title: String, message: String, controller: AnyObject) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}



public func getWeekDay(date: String) -> String? {

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: date)

    let weekDay = Calendar.current.component(.weekday, from: date!)

    let dateToday = Date()
    let todayFormatter = DateFormatter()
    todayFormatter.dateFormat = "dd.MM.yyyy"
    let today = Calendar.current.component(.weekday, from: dateToday)

    if weekDay == today {
        return "TODAY"
    } else {
        if weekDay == 1 {
            return "SUNDAY"
        } else if weekDay == 2 {
            return "MONDAY"
        } else if weekDay == 3 {
            return "TUESDAY"
        } else if weekDay == 4 {
            return "WEDNESDAY"
        } else if weekDay == 5 {
            return "THURSDAY"
        } else if weekDay == 6 {
            return "FRIDAY"
        } else if weekDay == 7 {
            return "SATURDAY"
        } else {
            return nil
        }
    }


}


// MARK:- Calculate Value for layout
public func getProportion(forValue: CGFloat) -> CGFloat {
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let calculated = CGFloat(forValue / 375) *  CGFloat(screenWidth)
    return calculated
}


// MARK:- Get UIColor from Hex String
public func hexColor(hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
