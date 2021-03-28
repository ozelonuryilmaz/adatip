//
//  Font + Extension.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

// MARK: *** Customize App Font
extension UIFont {
    
    // MARK: - Secondary Font
    enum FontStyle : String {
        case Bold = "Bold"
        case BoldItalic = "BoldItalic"
        case ExtraBold = "ExtraBold"
        case ExtraBoldItalic = "ExtraBoldItalic"
        case Italic = "Italic"
        case Light = "Light"
        case LightItalic = "LightItalic"
        case Regular = "Regular"
        case SemiBold = "SemiBold"
        case SemiBoldLight = "SemiBoldLight"
    }
    
    class func customFont(size : Int , customStyle : FontStyle) -> UIFont! {
        return UIFont(name: "\(Config.applicationFontName)-\(customStyle.rawValue)", size: CGFloat(size))
    }
    
}
