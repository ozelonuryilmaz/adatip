//
//  Image + Extension.swift
//  adatip
//
//  Created by Onur YILMAZ on 19.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
