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
    
    class func createGuest(deviceTokenId: String, complation: @escaping(_ success: Bool) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/create-guest"
        let parametre = ["deviceTokenId": deviceTokenId as AnyObject]
        let model = SuccessResponse.self
        
        BaseRemoteDataManager.request(url, method: .post, parameters: parametre, headers: Helper.getHeader(), type: model) { (response) in
            
            if let error = response.isError, error == true{
                failure(response.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            complation(true)
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }
    
}
