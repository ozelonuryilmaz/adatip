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
        
        let url = Constant.Url.PAGE + "v1/authentication/sign-in"
        let model = ApiResponse<GetSignInResult>.self
        let parametre = ["email": email as AnyObject,
                         "password": password as AnyObject]
        
        BaseRemoteDataManager.request(url, method: .post, parameters: parametre, headers: Helper.getHeaderWithoutToken(), type: model) { (data) in
            
            if let error = data.isError, error == true{
                failure(data.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = data.result{
                complation(data)
            }
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.exceptionMessage ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

    class func register(deviceTokenId: String?, firstName: String, lastName: String, email: String, confirmEmail: String, birthYear: String, fatherName: String, password: String, confirmPassword: String, complation: @escaping(_ register: GetRegisterResult) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/register"
        let model = ApiResponse<GetRegisterResult>.self
        let parametre = ["deviceTokenId": deviceTokenId as AnyObject,
                         "firstName": firstName as AnyObject,
                         "lastName": lastName as AnyObject,
                         "email": email as AnyObject,
                         "confirmEmail": confirmEmail as AnyObject,
                         "birthYear": birthYear as AnyObject,
                         "fatherName": fatherName as AnyObject,
                         "password": password as AnyObject,
                         "confirmPassword": confirmPassword as AnyObject]
        
        BaseRemoteDataManager.request(url, method: .post, parameters: parametre, headers: Helper.getHeaderWithoutToken(), type: model) { (data) in
            
            if let error = data.isError, error == true{
                failure(data.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = data.result{
                complation(data)
            }
        } failure: { (error, statusCode, errorResponse) in
            failure(errorResponse?.exceptionMessage ?? "an_unexpected_error_occurred".localizable())
        }
        
    }
    
}
