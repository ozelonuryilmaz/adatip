//
//  View + Extension.swift
//  adatip
//
//  Created by Onur YILMAZ on 19.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {//(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeft, topRightRadius: topRight, bottomLeftRadius: bottomLeft, bottomRightRadius: bottomRight)
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        
    }
    
    func layerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint(x: 0.0, y: 0.0)
        layer.cornerRadius = CGFloat(frame.width / 20)

        let color0 = UIColor(red:255.0/255, green:255.0/255, blue:255.0/255, alpha:0).cgColor
        let color1 = UIColor(red:250.0/255, green:250.0/255, blue: 250.0/255, alpha:0.26).cgColor
        let color2 = UIColor(red:240.0/255, green:240.0/255, blue: 240.0/255, alpha:0.52).cgColor
        let color3 = UIColor(red:235.0/255, green:235.0/255, blue: 235.0/255, alpha:1).cgColor
        let color4 = UIColor(red:230.0/255, green:237.0/255, blue:242.0/255, alpha:1).cgColor
        let color5 = UIColor(red:230.0/255, green:237.0/255, blue:242.0/255, alpha:1).cgColor
        let color6 = UIColor(red:230.0/255, green:237.0/255, blue:242.0/255, alpha:1).cgColor

        layer.colors = [color0,color1,color2,color3,color4,color5,color6]
        self.layer.insertSublayer(layer, at: 0)
    }
    
}





