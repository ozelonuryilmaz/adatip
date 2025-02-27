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
        
        static let ACTIVE = development //change app delegate url
    }
    
    struct Url {
        static let PAGE = Constant.Domains.ACTIVE
        static let API = Constant.Domains.ACTIVE + "api/"
    }
    
    struct UserDefaults {
        
        static let APP_LOGGED_IN_BEFORE = "appLoggedInBefore"
        static let HOSPITAL_ID = "hospitalId"
        static let HOSPITALL_TITLE = "hospitalTitle"
        static let APP_OPENS_FOR_FIRST_TIME = "appOpensForFirstTime"
        static let HAS_USER_LOGGED_IN = "hasUserLoggedIn"
        static let EMAIL = "email"
        static let FULL_NAME = "fullName"
        static let ACCESS_TOKEN = "accessToken"
        static let REFRESH_TOKEN = "refreshToken"
        static let USER_ROLE = "userRole"
    }
    
    struct NotificationKeys {
        static let TABBAR_PRIMARY_CENTER_BUTTON = "tabBarPrimaryCenterButton"
        static let TABBAR_SECONDARY_CENTER_BUTTON = "tabBarSecondaryPrimaryCenterButton"
        static let CHANGE_HOSPITAL = "changeHospital"
        static let CHANGE_HOSPITAL_INFO = "changeHospitalInfo"
        static let CHANGE_HOSPITAL_POP_VC = "changeHospitalPopVC"
        static let USER_ROLE = "userRole"
    }

}
