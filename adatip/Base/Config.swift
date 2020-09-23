//
//  Config.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Config: NSObject {
    
    static let applicationDomain = "http://adatip.btkurumsal.xyz/"
    static let developmentDomain = "http://adatip.btkurumsal.xyz/"
    
    static let applicationTabBarCount = 5 // You can customize tabbar names from Localizable. Strings under the Resources
    
    static let applicationSupportedLanguageCodesWithNames = ["tr-TR":"Türkçe", "en-US":"English"] // For language selection screen RMSLanguageSelection
    
    static let applicationSupportedLanguageCodes = ["tr-TR", "en-US"] // You must add localize. Strings files under the Resources
    
    static let applicationFontName = "OpenSans" // Font files under the Resources
}
