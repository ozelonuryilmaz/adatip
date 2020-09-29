//
//  AuthenticationViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class AuthenticationViewModel: BaseViewModel {
    
    class func signIn(email: String, password: String, complation: @escaping(_ signIn: GetSignInResult) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        NetworkManager.signIn(email: email, password: password, success: { (data) in
            
            if let error = data.isError, error == true{
                failure(data.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = data.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

    class func register(deviceTokenId: String?, firstName: String, lastName: String, email: String, confirmEmail: String, birthYear: String, fatherName: String, password: String, confirmPassword: String, complation: @escaping(_ register: GetRegisterResult) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        NetworkManager.register(deviceTokenId: deviceTokenId, firstName: firstName, lastName: lastName, email: email, confirmEmail: confirmEmail, birthYear: birthYear, fatherName: fatherName, password: password, confirmPassword: confirmPassword, success: { (data) in
            
            if let error = data.isError, error == true{
                failure(data.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = data.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }
    
}
