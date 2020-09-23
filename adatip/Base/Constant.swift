//
//  Constant.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

class Constant: NSObject {
    
    // MARK: *** Endpoints Constants
    private struct Domains{
        static let development = Config.developmentDomain
        static let production = Config.applicationDomain
        
        static let ACTIVE = development
    }
    
    struct Url {
        static let PAGE = Constant.Domains.ACTIVE
        static let API = Constant.Domains.ACTIVE + "api/"
    }
    
    struct UserDefaults {
        
        static let APP_LOGGED_IN_BEFORE = "appLoggedInBefore"
        static let TOKEN = "token"
        static let HOSPITAL_ID = "hospitalId"
        static let HOSPITALL_TITLE = "hospitalTitle"
        static let APP_OPENS_FOR_FIRST_TIME = "appOpensForFirstTime"
    }
    
    struct NotificationKeys {
        static let TABBAR_CENTER_BUTTON = "tabBarCenterButton"
        static let CHANGE_HOSPITAL = "changeHospital"
        static let CHANGE_HOSPITAL_INFO = "changeHospitalInfo"
    }

}
