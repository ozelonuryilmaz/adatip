//
//  NetworkManager.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    // MARK: *** Helpers
    class func getHeader() -> [String : String] {
        
        let token = UserDefaults.standard.string(forKey: Constant.UserDefaults.TOKEN) ?? ""
        let header : [String:String] = ["Authorization": "Bearer " + token, "accept": "application/json"]
        
        return header
    }
    
    class func getHeaderWithoutToken() -> [String : String] {
        
        let header : [String:String] = ["accept": "application/json"]
        
        return header
    }
    
    class func printAndShowError(url: String, error: Error, statusCode: Int) {
        print("***ERROR***\nurl = \(url)\nstatusCode = \(statusCode)\nlocalized = \(error.localizedDescription)\nerror = \(error)\n")
    }
    
    //MARK: - Get Hospital List
    class func getHospitalList(success:@escaping (_ response: GetHospitalsResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetHospitalsResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/hospital/list"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetHospitalsResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetHospitalsResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetHospitalsResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetHospitalsResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    
    //MARK: - Get Banner
    class func getAnnouncements(hospitalId: Int, success:@escaping (_ response: GetAnnouncementsResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetAnnouncementsResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/list/\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetAnnouncementsResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetAnnouncementsResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetAnnouncementsResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetAnnouncementsResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    
    //MARK: - Get Banner
    class func getAnnouncementDetail(announcementId: Int, success:@escaping (_ response: GetAnnouncementDetailResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetAnnouncementDetailResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/\(announcementId)/details"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetAnnouncementDetailResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetAnnouncementDetailResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetAnnouncementDetailResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetAnnouncementDetailResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    
    //MARK: - Get Our Units (OurUnits)
    class func getUnitCategoryList(hospitalId: Int, success:@escaping (_ response: GetUnitCategoryResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetUnitCategoryResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/unit-category/list/\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetUnitCategoryResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetUnitCategoryResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetUnitCategoryResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetUnitCategoryResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    
    //MARK: - Get Unit Sub Categories (UnitCategory)
    class func getUnitSubCategoryList(hospitalId: Int, unitCategoryId: Int, success:@escaping (_ response: GetUnitSubCategoryResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetUnitSubCategoryResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/unit-category/list/\(hospitalId)/\(unitCategoryId)/subCategories"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetUnitSubCategoryResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetUnitSubCategoryResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetUnitSubCategoryResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetUnitSubCategoryResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    
    //MARK: - Get Doctors (StaffCategory)
    class func getDoctorList(hospitalId: Int, success:@escaping (_ response: GetDoctorResponseModel) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: GetDoctorResponseModel?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/doctor/list/\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : GetDoctorResponseModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(GetDoctorResponseModel.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : GetDoctorResponseModel
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(GetDoctorResponseModel.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }

}
