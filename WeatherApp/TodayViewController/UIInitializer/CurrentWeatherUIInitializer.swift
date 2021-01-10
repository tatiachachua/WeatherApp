//
//  CurrentWeatherUIInitializer.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 1/3/21.
//  Copyright © 2021 Tatia Chachua. All rights reserved.
//

import UIKit

class CurrentWeatherUIInitializer: NSObject {

    unowned var parentVC: TodayViewController
    init(with parent: TodayViewController) {
        self.parentVC = parent
    }
    
    func setupSubviews() {
        
        parentVC.view.addSubview(parentVC.colorfulLine)
        parentVC.colorfulLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.colorfulLine.topAnchor.constraint(equalTo: parentVC.view.safeAreaLayoutGuide.topAnchor),
            parentVC.colorfulLine.leadingAnchor.constraint(equalTo: parentVC.view.leadingAnchor),
            parentVC.colorfulLine.trailingAnchor.constraint(equalTo: parentVC.view.trailingAnchor),
            parentVC.colorfulLine.heightAnchor.constraint(equalToConstant: 2),
        ])
        
        parentVC.dayIcon.contentMode = .scaleAspectFill
        parentVC.dayIcon.backgroundColor = .clear
        parentVC.view.addSubview(parentVC.dayIcon)
        parentVC.dayIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.dayIcon.topAnchor.constraint(equalTo: parentVC.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            parentVC.dayIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -30),
            parentVC.dayIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 30),
            parentVC.dayIcon.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        parentVC.titleLabel.backgroundColor = .clear
        parentVC.titleLabel.textAlignment = .center
        parentVC.titleLabel.text = "Meria, GE"
        parentVC.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        parentVC.view.addSubview(parentVC.titleLabel)
        parentVC.titleLabel.translatesAutoresizingMaskIntoConstraints = false

        parentVC.weatherInfoLab.backgroundColor = .clear
        parentVC.weatherInfoLab.textAlignment = .center
        parentVC.weatherInfoLab.textColor = hexColor(hex: "#498CEE")
        parentVC.weatherInfoLab.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        parentVC.view.addSubview(parentVC.weatherInfoLab)
        parentVC.weatherInfoLab.translatesAutoresizingMaskIntoConstraints = false

        parentVC.topLine = TopDotLine(frame: CGRect.zero, isDark: parentVC.isDark)
        parentVC.view.addSubview(parentVC.topLine)
        parentVC.topLine.translatesAutoresizingMaskIntoConstraints = false

        parentVC.bottomLine = BottomDotLine(frame: CGRect.zero, isDark: parentVC.isDark)
        parentVC.view.addSubview(parentVC.bottomLine)
        parentVC.bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        parentVC.shareButton.setTitleColor(hexColor(hex: "#EB9937"), for: .normal)
        parentVC.shareButton.setTitle("Share", for: .normal)
        parentVC.shareButton.backgroundColor = .clear
        parentVC.shareButton.addTarget(parentVC, action: #selector(parentVC.shareButtonPressed), for: .touchUpInside)
        parentVC.view.addSubview(parentVC.shareButton)
        parentVC.shareButton.translatesAutoresizingMaskIntoConstraints = false


        // add humidity, speed, direction... views

        parentVC.humidityIcon.backgroundColor = .lightGray
        parentVC.view.addSubview(parentVC.humidityIcon)
        parentVC.humidityIcon.translatesAutoresizingMaskIntoConstraints = false

        parentVC.humidityLabel.backgroundColor = .clear
        parentVC.humidityLabel.textAlignment = .center
        parentVC.humidityLabel.font = UIFont.systemFont(ofSize: 12)
        parentVC.view.addSubview(parentVC.humidityLabel)
        parentVC.humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.humidityLabel.topAnchor.constraint(equalTo: parentVC.humidityIcon.bottomAnchor, constant: 5),
            parentVC.humidityLabel.leadingAnchor.constraint(equalTo: parentVC.humidityIcon.centerXAnchor, constant: -30),
            parentVC.humidityLabel.trailingAnchor.constraint(equalTo: parentVC.humidityIcon.centerXAnchor, constant: 30),
            parentVC.humidityLabel.heightAnchor.constraint(equalToConstant: 15),
        ])

        parentVC.dropIcon.backgroundColor = .lightGray
        parentVC.view.addSubview(parentVC.dropIcon)
        parentVC.dropIcon.translatesAutoresizingMaskIntoConstraints = false

        parentVC.dropLabel.backgroundColor = .clear
        parentVC.dropLabel.text = "-"
        parentVC.dropLabel.textAlignment = .center
        parentVC.dropLabel.font = UIFont.systemFont(ofSize: 12)
        parentVC.view.addSubview(parentVC.dropLabel)
        parentVC.dropLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.dropLabel.topAnchor.constraint(equalTo: parentVC.dropIcon.bottomAnchor, constant: 5),
            parentVC.dropLabel.leadingAnchor.constraint(equalTo: parentVC.dropIcon.centerXAnchor, constant: -30),
            parentVC.dropLabel.trailingAnchor.constraint(equalTo: parentVC.dropIcon.centerXAnchor, constant: 30),
            parentVC.dropLabel.heightAnchor.constraint(equalToConstant: 15),
        ])

        parentVC.hpaIcon.backgroundColor = .lightGray
        parentVC.view.addSubview(parentVC.hpaIcon)
        parentVC.hpaIcon.translatesAutoresizingMaskIntoConstraints = false
        
        parentVC.hpaLabel.backgroundColor = .clear
        parentVC.hpaLabel.textAlignment = .center
        parentVC.hpaLabel.font = UIFont.systemFont(ofSize: 12)
        parentVC.view.addSubview(parentVC.hpaLabel)
        parentVC.hpaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.hpaLabel.topAnchor.constraint(equalTo: parentVC.hpaIcon.bottomAnchor, constant: 5),
            parentVC.hpaLabel.leadingAnchor.constraint(equalTo: parentVC.hpaIcon.centerXAnchor, constant: -30),
            parentVC.hpaLabel.trailingAnchor.constraint(equalTo: parentVC.hpaIcon.centerXAnchor, constant: 30),
            parentVC.hpaLabel.heightAnchor.constraint(equalToConstant: 15),
        ])

        parentVC.speedIcon.backgroundColor = .lightGray
        parentVC.view.addSubview(parentVC.speedIcon)
        parentVC.speedIcon.translatesAutoresizingMaskIntoConstraints = false
        
        parentVC.speedLabel.backgroundColor = .clear
        parentVC.speedLabel.textAlignment = .center
        parentVC.speedLabel.font = UIFont.systemFont(ofSize: 12)
        parentVC.view.addSubview(parentVC.speedLabel)
        parentVC.speedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.speedLabel.topAnchor.constraint(equalTo: parentVC.speedIcon.bottomAnchor, constant: 5),
            parentVC.speedLabel.leadingAnchor.constraint(equalTo: parentVC.speedIcon.centerXAnchor, constant: -30),
            parentVC.speedLabel.trailingAnchor.constraint(equalTo: parentVC.speedIcon.centerXAnchor, constant: 30),
            parentVC.speedLabel.heightAnchor.constraint(equalToConstant: 15),
        ])

        parentVC.directionIcon.backgroundColor = .lightGray
        parentVC.view.addSubview(parentVC.directionIcon)
        parentVC.directionIcon.translatesAutoresizingMaskIntoConstraints = false
        
        parentVC.directionLabel.textAlignment = .center
        parentVC.directionLabel.backgroundColor = .clear
        parentVC.directionLabel.font = UIFont.systemFont(ofSize: 12)
        parentVC.view.addSubview(parentVC.directionLabel)
        parentVC.directionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentVC.directionLabel.topAnchor.constraint(equalTo: parentVC.directionIcon.bottomAnchor, constant: 5),
            parentVC.directionLabel.leadingAnchor.constraint(equalTo: parentVC.directionIcon.centerXAnchor, constant: -30),
            parentVC.directionLabel.trailingAnchor.constraint(equalTo: parentVC.directionIcon.centerXAnchor, constant: 30),
            parentVC.directionLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
        
        
        if #available(iOS 13.0, *) {
            if parentVC.traitCollection.userInterfaceStyle == .dark {
                // dark
                parentVC.titleLabel.textColor = .white
            } else {
                //not dark
                setColorsForNotDarkMode()
            }
        } else {
            //not dark
            setColorsForNotDarkMode()
        }
    }
    
    func setColorsForNotDarkMode() {
        parentVC.titleLabel.textColor = hexColor(hex: "#0D0B0E")
        parentVC.humidityLabel.textColor = hexColor(hex: "#040205")
        parentVC.dropLabel.textColor = hexColor(hex: "#040205")
        parentVC.hpaLabel.textColor = hexColor(hex: "#040205")
        parentVC.speedLabel.textColor = hexColor(hex: "#040205")
        parentVC.directionLabel.textColor = hexColor(hex: "#040205")
    }
    
    
    func updatConstraintsForPortrait() {
        
        NSLayoutConstraint.deactivate(parentVC.constraints)
        parentVC.constraints.removeAll()
        parentVC.constraints.append(parentVC.dayIcon.topAnchor.constraint(equalTo: parentVC.view.safeAreaLayoutGuide.topAnchor, constant: 80))
        parentVC.constraints.append(parentVC.dayIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -30))
        parentVC.constraints.append(parentVC.dayIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 30))
        parentVC.constraints.append(parentVC.dayIcon.heightAnchor.constraint(equalToConstant: 60))
        
        parentVC.constraints.append( parentVC.titleLabel.topAnchor.constraint(equalTo: parentVC.dayIcon.bottomAnchor, constant: 20))
        parentVC.constraints.append( parentVC.titleLabel.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -40))
        parentVC.constraints.append(parentVC.titleLabel.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 40))
        parentVC.constraints.append(parentVC.titleLabel.heightAnchor.constraint(equalToConstant: 18))
        
        parentVC.constraints.append( parentVC.weatherInfoLab.topAnchor.constraint(equalTo: parentVC.titleLabel.bottomAnchor, constant: 10))
        parentVC.constraints.append( parentVC.weatherInfoLab.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -100))
        parentVC.constraints.append( parentVC.weatherInfoLab.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 100))
        parentVC.constraints.append( parentVC.weatherInfoLab.heightAnchor.constraint(equalToConstant: 22))
        
        parentVC.constraints.append( parentVC.topLine.topAnchor.constraint(equalTo: parentVC.weatherInfoLab.bottomAnchor, constant: 15))
        parentVC.constraints.append( parentVC.topLine.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -100))
        parentVC.constraints.append( parentVC.topLine.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 100))
        parentVC.constraints.append( parentVC.topLine.heightAnchor.constraint(equalToConstant: 1))
        
        
        
        parentVC.constraints.append( parentVC.humidityIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 10))
        parentVC.constraints.append(parentVC.humidityIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -140))
        parentVC.constraints.append(parentVC.humidityIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -110))
        parentVC.constraints.append(parentVC.humidityIcon.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append(parentVC.dropIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 10))
        parentVC.constraints.append(parentVC.dropIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -15))
        parentVC.constraints.append(parentVC.dropIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 15))
        parentVC.constraints.append(parentVC.dropIcon.heightAnchor.constraint(equalToConstant: 30))
      
        parentVC.constraints.append(parentVC.hpaIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 10))
        parentVC.constraints.append(parentVC.hpaIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 110))
        parentVC.constraints.append(parentVC.hpaIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 140))
        parentVC.constraints.append(parentVC.hpaIcon.heightAnchor.constraint(equalToConstant: 30))
       

        parentVC.constraints.append(parentVC.speedIcon.topAnchor.constraint(equalTo: parentVC.bottomLine.topAnchor, constant: -60))
        parentVC.constraints.append(parentVC.speedIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -77))
        parentVC.constraints.append(parentVC.speedIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -47))
        parentVC.constraints.append(parentVC.speedIcon.heightAnchor.constraint(equalToConstant: 30))
        

        parentVC.constraints.append(parentVC.directionIcon.topAnchor.constraint(equalTo: parentVC.bottomLine.topAnchor, constant: -60))
        parentVC.constraints.append(parentVC.directionIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 47))
        parentVC.constraints.append(parentVC.directionIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 77))
        parentVC.constraints.append(parentVC.directionIcon.heightAnchor.constraint(equalToConstant: 30))
        
        
        parentVC.constraints.append( parentVC.bottomLine.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 140))
        parentVC.constraints.append( parentVC.bottomLine.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -100))
        parentVC.constraints.append( parentVC.bottomLine.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 100))
        parentVC.constraints.append( parentVC.bottomLine.heightAnchor.constraint(equalToConstant: 1))
        
        parentVC.constraints.append( parentVC.shareButton.topAnchor.constraint(equalTo: parentVC.bottomLine.bottomAnchor, constant: 15))
        parentVC.constraints.append( parentVC.shareButton.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -60))
        parentVC.constraints.append( parentVC.shareButton.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 60))
        parentVC.constraints.append( parentVC.shareButton.heightAnchor.constraint(equalToConstant: 35))
        
        NSLayoutConstraint.activate(parentVC.constraints)
        
        parentVC.titleLabel.textAlignment = .center
        parentVC.weatherInfoLab.textAlignment = .center
        

    }
    
    
    func updatConsraintstForLandscape() {

        NSLayoutConstraint.deactivate(parentVC.constraints)
        parentVC.constraints.removeAll()
        
        parentVC.constraints.append(parentVC.dayIcon.topAnchor.constraint(equalTo: parentVC.view.safeAreaLayoutGuide.topAnchor, constant: 30))
        parentVC.constraints.append(parentVC.dayIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -60))
        parentVC.constraints.append(parentVC.dayIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 1))
        parentVC.constraints.append(parentVC.dayIcon.heightAnchor.constraint(equalToConstant: 60))
        
        parentVC.constraints.append( parentVC.titleLabel.topAnchor.constraint(equalTo: parentVC.dayIcon.topAnchor))
        parentVC.constraints.append( parentVC.titleLabel.leadingAnchor.constraint(equalTo: parentVC.dayIcon.leadingAnchor, constant: 70))
        parentVC.constraints.append(parentVC.titleLabel.trailingAnchor.constraint(equalTo: parentVC.dayIcon.trailingAnchor, constant: 140))
        parentVC.constraints.append(parentVC.titleLabel.heightAnchor.constraint(equalToConstant: 18))
        
        parentVC.constraints.append( parentVC.weatherInfoLab.topAnchor.constraint(equalTo: parentVC.titleLabel.bottomAnchor, constant: 10))
        parentVC.constraints.append( parentVC.weatherInfoLab.leadingAnchor.constraint(equalTo: parentVC.dayIcon.leadingAnchor, constant: 70))
        parentVC.constraints.append( parentVC.weatherInfoLab.trailingAnchor.constraint(equalTo: parentVC.dayIcon.leadingAnchor, constant: 240))
        parentVC.constraints.append( parentVC.weatherInfoLab.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append( parentVC.topLine.topAnchor.constraint(equalTo: parentVC.weatherInfoLab.bottomAnchor, constant: 25))
        parentVC.constraints.append( parentVC.topLine.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -150))
        parentVC.constraints.append( parentVC.topLine.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 150))
        parentVC.constraints.append( parentVC.topLine.heightAnchor.constraint(equalToConstant: 1))
        
       
        parentVC.constraints.append(parentVC.dropIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 25))
        parentVC.constraints.append(parentVC.dropIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -15))
        parentVC.constraints.append(parentVC.dropIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 15))
        parentVC.constraints.append(parentVC.dropIcon.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append(parentVC.speedIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 25))
        parentVC.constraints.append(parentVC.speedIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -120))
        parentVC.constraints.append(parentVC.speedIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -90))
        parentVC.constraints.append(parentVC.speedIcon.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append( parentVC.humidityIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 25))
        parentVC.constraints.append(parentVC.humidityIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -225))
        parentVC.constraints.append(parentVC.humidityIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -195))
        parentVC.constraints.append(parentVC.humidityIcon.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append(parentVC.directionIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 25))
        parentVC.constraints.append(parentVC.directionIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 90))
        parentVC.constraints.append(parentVC.directionIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 120))
        parentVC.constraints.append(parentVC.directionIcon.heightAnchor.constraint(equalToConstant: 30))
        
        parentVC.constraints.append(parentVC.hpaIcon.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 25))
        parentVC.constraints.append(parentVC.hpaIcon.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 195))
        parentVC.constraints.append(parentVC.hpaIcon.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 225))
        parentVC.constraints.append(parentVC.hpaIcon.heightAnchor.constraint(equalToConstant: 30))
        
        
        parentVC.constraints.append( parentVC.bottomLine.topAnchor.constraint(equalTo: parentVC.topLine.bottomAnchor, constant: 100))
        parentVC.constraints.append( parentVC.bottomLine.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -150))
        parentVC.constraints.append( parentVC.bottomLine.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 150))
        parentVC.constraints.append( parentVC.bottomLine.heightAnchor.constraint(equalToConstant: 1))
        
        parentVC.constraints.append( parentVC.shareButton.topAnchor.constraint(equalTo: parentVC.bottomLine.bottomAnchor, constant: 10))
        parentVC.constraints.append( parentVC.shareButton.leadingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: -60))
        parentVC.constraints.append( parentVC.shareButton.trailingAnchor.constraint(equalTo: parentVC.view.centerXAnchor, constant: 60))
        parentVC.constraints.append( parentVC.shareButton.heightAnchor.constraint(equalToConstant: 35))
        
        NSLayoutConstraint.activate(parentVC.constraints)
        
        parentVC.titleLabel.textAlignment = .left
        parentVC.weatherInfoLab.textAlignment = .left
  
    }
    
    
}
