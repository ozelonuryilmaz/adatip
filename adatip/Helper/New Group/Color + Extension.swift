//
//  Color.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

// MARK: *** App Colors
extension UIColor {
    
    //MARK: - Main Colors
    
    class var primaryColor: UIColor {
        return UIColor.init(hexString: "#14B4D0")
    }
    
    class var secondaryColor: UIColor {
        return UIColor.init(hexString: "#0C4F83")
    }
    
    class var primaryLightColor: UIColor {
        return UIColor.init(hexString: "#229A4E")
    }
    
    class var primaryDarkColor: UIColor {
        return UIColor.init(hexString: "#336536")
    }
    
    //MARK: - Text Colors
    
    class var textColorOnPrimary: UIColor {
        return UIColor.init(hexString: "#050505")
    }
    
    class var textColorOnPrimaryLight: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnPrimaryDark: UIColor {
        return UIColor.init(hexString: "#000000")
    }
    
    class var textColorOnSecondary: UIColor {
        return UIColor.init(hexString: "#808080")
    }
    
    //MARK: - Custom Colors
    
    class var customColorWhite: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var customColorWhiteLight: UIColor {
        return UIColor.init(hexString: "#F5F8FA")
    }
    
    class var customColorWhiteDarker: UIColor {
        return UIColor.init(hexString: "#D2DCE3")
    }
    
    class var customColorGrey: UIColor {
        return UIColor.init(hexString: "#808080")
    }
    
    class var customColorLightGrey: UIColor {
        return UIColor.init(hexString: "#E7EDF1")
    }
    
    class var customColorDarkGrey: UIColor {
        return UIColor.init(hexString: "#696969")
    }
    
    class var customColorBlack: UIColor {
        return UIColor.init(hexString: "#212231")
    }
    
    class var customColorBlue: UIColor {
        return UIColor.init(hexString: "#007AFF")
    }
    
    class var customColorRed: UIColor {
        return UIColor.init(hexString: "#D9390D")
    }
    
    class var customColorGreen: UIColor {
        return UIColor.init(hexString: "#27B085")
    }
    
    class var customColorOrange: UIColor {
        return UIColor.init(hexString: "#FF7900")
    }
    
    class var customColorYellow: UIColor {
        return UIColor.init(hexString: "#F4C430")
    }
    
    // Convert HexColor to UIColor
    convenience init(hexString: String) {
        
        let hexStr = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int32 = UInt32()
        Scanner(string: hexStr).scanHexInt32(&int32)
        let a, r, g, b: UInt32
        switch hexStr.count {
        case 3: // RGB * 12-bit
            (a, r, g, b) = (255, (int32 >> 8) * 17, (int32 >> 4 & 0xF) * 17, (int32 & 0xF) * 17)
        case 6: // RGB * 24-bit
            (a, r, g, b) = (255, int32 >> 16, int32 >> 8 & 0xFF, int32 & 0xFF)
        case 8: // ARGB * 32-bit
            (a, r, g, b) = (int32 >> 24, int32 >> 16 & 0xFF, int32 >> 8 & 0xFF, int32 & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        
    }
    
}
