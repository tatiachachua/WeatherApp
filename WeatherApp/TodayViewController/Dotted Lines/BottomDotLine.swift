//
//  BottomDotLine.swift
//  WeatherApp
//
//  Created by Tatia Chachua on 1/3/21.
//  Copyright © 2021 Tatia Chachua. All rights reserved.
//

import UIKit

class BottomDotLine: UIView {

    var isDark: Bool!

    init(frame: CGRect, isDark: Bool!) {
        super.init(frame: frame)
        self.isDark = isDark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupLayer()
    }
    
    func setupLayer() {
        
        var color = hexColor(hex: "#8B898B")
        
        if isDark {
            color = hexColor(hex: "#FAF8FB")
        }
        
        self.layer.sublayers?.filter{ $0 is CAShapeLayer }.forEach{ $0.removeFromSuperlayer() }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineDashPattern = [2,3]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        
    }

}
