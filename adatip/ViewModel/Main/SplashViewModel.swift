//
//  SplashViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class SplashViewModel: BaseViewModel {
    
    class var shared: SplashViewModel {
        struct Static {
            static let instance: SplashViewModel = SplashViewModel()
        }
        return Static.instance
    }
    
    var nums = 37
    
}
