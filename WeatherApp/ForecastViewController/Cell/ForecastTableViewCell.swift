//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 12/31/20.
//  Copyright © 2020 Tatia Chachua. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var timeLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        lab.font = UIFont.systemFont(ofSize: 14)
        return lab
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        lab.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return lab
    }()
    
    lazy var temperatureLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .right
        lab.textColor = hexColor(hex: "#4E91F1")
        lab.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return lab
    }()
    
    
    class func reuseIndentifier() -> String {
        return "ForecastCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        weatherIcon.frame = CGRect(x: 5, y: 0, width: 70, height: 70)
        addSubview(weatherIcon)

        timeLabel.frame = CGRect(x: weatherIcon.frame.maxX + 10, y: 18.5, width: 190, height: 17)
        addSubview(timeLabel)

        descriptionLabel.frame = CGRect(x: weatherIcon.frame.maxX + 10, y: timeLabel.frame.maxY + 1, width: 190, height: 16)
        addSubview(descriptionLabel)

        temperatureLabel.frame = CGRect(x: bounds.width - 80, y: 10, width: 70, height: self.bounds.height - 20)
        addSubview(temperatureLabel)
    }
    
    override func prepareForReuse() {
        self.weatherIcon.image = nil
    }
    
    
    func loadImage(imageName: String) {
        if let url = URL(string:  "http://openweathermap.org/img/wn/\(imageName)@2x.png") {
            let data = try? Data(contentsOf: url)
            self.weatherIcon.image = UIImage(data: data!)
        }
    }
    

}
