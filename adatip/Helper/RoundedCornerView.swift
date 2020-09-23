//
//  RoundedCornerView.swift
//  adatip
//
//  Created by Onur YILMAZ on 21.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

@IBDesignable
open class RoundedCornerView: UIView  {

    private func applyRadiusMaskFor() {
        let path = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }

    @IBInspectable
    open var topLeftRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var topRightRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var bottomLeftRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var bottomRightRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        applyRadiusMaskFor()
    }
}

/*
 
 @IBDesignable
 class RoundedCornerView: UIView {

     var cornerRadiusValue : CGFloat = 0
     var corners : UIRectCorner = []
     
     @IBInspectable public var cornerRadius:CGFloat {
         get {
             return cornerRadiusValue
         }
         set {
             cornerRadiusValue = newValue
         }
     }
     
     @IBInspectable public var topLeft : Bool {
         get {
             return corners.contains(.topLeft)
         }
         set {
             setCorner(newValue: newValue, for: .topLeft)
         }
     }
     
     @IBInspectable public var topRight : Bool {
         get {
             return corners.contains(.topRight)
         }
         set {
             setCorner(newValue: newValue, for: .topRight)
         }
     }
     
     @IBInspectable public var bottomLeft : Bool {
         get {
             return corners.contains(.bottomLeft)
         }
         set {
             setCorner(newValue: newValue, for: .bottomLeft)
         }
     }
     
     @IBInspectable public var bottomRight : Bool {
         get {
             return corners.contains(.bottomRight)
         }
         set {
             setCorner(newValue: newValue, for: .bottomRight)
         }
     }
     
     func setCorner(newValue: Bool, for corner: UIRectCorner) {
         if newValue {
             addRectCorner(corner: corner)
         } else {
             removeRectCorner(corner: corner)
         }
     }
     
     func addRectCorner(corner: UIRectCorner) {
         corners.insert(corner)
         updateCorners()
     }
     
     func removeRectCorner(corner: UIRectCorner) {
         if corners.contains(corner) {
             corners.remove(corner)
             updateCorners()
         }
     }
     
     func updateCorners() {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
     }

 }
 
 */
