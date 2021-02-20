//
//  BaseRemoteDataManager.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.02.2021.
//  Copyright © 2021 Onur YILMAZ. All rights reserved.
//

import UIKit
import Alamofire

class BaseRemoteDataManager: NSObject {
    
    static func request<T: Codable>(_ url: String, method: HTTPMethod,
                                    parameters: [String : Any]?,
                                    encoding: ParameterEncoding = JSONEncoding.default, //URLEncoding.default
                                    headers: HTTPHeaders?,
                                    type: T.Type?,
                                    success:@escaping (_ response: T) -> Void,
                                    failure:@escaping (_ error:Error, _ statusCode:Int,
                                                       _ errorResponse: ErrorResponse?) -> Void) -> Void {
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                //MARK: *** Log
                print("Url: ", url) // EndPoint
                if let parameter = parameters {
                    let parameterJSON = parameter as NSDictionary
                    print("Params:\n \(parameterJSON)") // Query Params
                }else { print("Parameters: nil") }
//                if let JSON = response.value {
//                    let responseJSON = JSON as! NSDictionary
//                    print("result: \(responseJSON)") // Response
//                }else { print("result: nil") }
                
                //MARK: *** Result
                switch response.result {
                case .success( _):
                    
                    do {
                        let decoder = JSONDecoder()
                        guard let data = response.data else { return }
                        let theResponse = try decoder.decode(T.self, from: data)
                        success(theResponse)
                        
                    } catch let error {
                        Helper.printAndShowError(url: url, error: error, statusCode: -1)
                        failure(error, -1, nil)
                    }
                    
                case .failure(let error):
                    
                    let statusCode : Int = response.response?.statusCode ?? 0
                    Helper.printAndShowError(url: url, error: error, statusCode: statusCode)
                    
                    guard let errorData = response.data else {
                        failure(error, statusCode, nil)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let theErrorResponse = try decoder.decode(ErrorResponse.self, from: errorData)
                        failure(error, statusCode, theErrorResponse)
                        
                    } catch let error {
                        Helper.printAndShowError(url: url, error: error, statusCode: -2)
                        failure(error, -2, nil)
                    }
                }
            }
    }
    
    
    
    
}
