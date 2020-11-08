//
//  BaseNetworkManager.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import Alamofire

class BaseNetworkManager: NSObject {
    
    class func post(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response: Foundation.Data?) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: Foundation.Data?) -> Void ) -> Void {
        
        Alamofire.request(url, method:.post, parameters: parameters, encoding:JSONEncoding.default, headers:headers).validate(statusCode: 200..<300).responseJSON(completionHandler: { response in
            
            //MARK: * Log
            print("Url: ", url)
            if let parameter = parameters {
                let parameterJSON = parameter as NSDictionary
                print("Parameters:\n \(parameterJSON)")
            }else { print("Parameters: nil") }
            if let JSON = response.result.value {
                let responseJSON = JSON as! NSDictionary
                print("result: \(responseJSON)")
            }else { print("result: nil") }
            
            switch response.result {
                
            case .success( _):
                
                success(response.data)
                
            case .failure(let error):
                let statusCode : Int = response.response?.statusCode ?? 0
                failure(error, statusCode, response.data)
            }
            
        })
    }
    
    
    class func get(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Foundation.Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int, _ errorResponse: Foundation.Data?) -> Void ) -> Void {
        
        Alamofire.request(url, method:.get, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate(statusCode: 200..<300).responseJSON{ response in
            
            //MARK: * Log
            print("Url: ", url)
            if let parameter = parameters {
                let parameterJSON = parameter as NSDictionary
                print("Parameters:\n \(parameterJSON)")
            }else { print("parameters: nil") }
//            if let JSON = response.result.value {
//                let responseJSON = JSON as! NSDictionary
//                print("result: \(responseJSON)")
//            }else { print("result: nil") }
            
            switch response.result {
                
            case .success( _):
                success(response.data)
                
            case .failure(let error):
                let statusCode : Int = response.response?.statusCode ?? 0
                failure(error, statusCode, response.data)
            }
        }
    }
    
    class func put(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Foundation.Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int, _ errorResponse: Foundation.Data?) -> Void ) -> Void {
        
        Alamofire.request(url, method:.put, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate(statusCode: 200..<300).responseJSON{ response in
            
            //MARK: * Log
            print("Url: ", url)
            if let parameter = parameters {
                let parameterJSON = parameter as NSDictionary
                print("Parameters:\n \(parameterJSON)")
            }else { print("parameters: nil") }
            
            switch response.result {
                
            case .success( _):
                success(response.data)
                
            case .failure(let error):
                let statusCode : Int = response.response?.statusCode ?? 0
                failure(error, statusCode, response.data)
            }
        }
    }

}
