//
//  ColorfulLine.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 1/3/21.
//  Copyright © 2021 Tatia Chachua. All rights reserved.
//

import UIKit

class ColorfulLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupLayer()
    }
    
    func setupLayer() {
        
        self.layer.sublayers?.filter{ $0 is CAShapeLayer }.forEach{ $0.removeFromSuperlayer() }
        
        let width = Int(self.frame.size.width / 6)
        
        var i = 0
        while i < Int(self.bounds.width) {
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.lineWidth = 3
            
            if i <= 1 * width {
                shapeLayer.strokeColor = hexColor(hex: "#661668").cgColor
            } else if i <= 2 * width {
                shapeLayer.strokeColor = hexColor(hex: "#CD732C").cgColor
            } else if i <= 3 * width {
                shapeLayer.strokeColor = hexColor(hex: "#67DE43").cgColor
            } else if i <= 4 * width {
                shapeLayer.strokeColor = hexColor(hex: "#0022D7").cgColor
            } else if i <= 5 * width {
                shapeLayer.strokeColor = hexColor(hex: "#E8E24B").cgColor
            } else if i <= 6 * width {
                shapeLayer.strokeColor = hexColor(hex: "#CB2A1D").cgColor
            }

            let path = CGMutablePath()
            path.addLines(between: [CGPoint(x: i, y: 0),
                                    CGPoint(x: i + 2, y: 0)])
            shapeLayer.path = path
            layer.addSublayer(shapeLayer)
            
            i += 4
        }
        
        
    }
    

}
