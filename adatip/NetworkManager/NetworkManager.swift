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
        
        let token = UserDefaults.standard.string(forKey: Constant.UserDefaults.ACCESS_TOKEN) ?? ""
        let header : [String:String] = ["Authorization": "Bearer " + token, "Content-Type": "application/json"]
        
        return header
    }
    
    class func getHeaderWithoutToken() -> [String : String] {
        
        let header : [String:String] = ["Content-Type": "application/json"]
        
        return header
    }
    
    class func printAndShowError(url: String, error: Error, statusCode: Int) {
        print("***ERROR***\nurl = \(url)\nstatusCode = \(statusCode)\nlocalized = \(error.localizedDescription)\nerror = \(error)\n")
    }
    /*
    //MARK: - Get Hospital List
    class func getHospitalList(success:@escaping (_ response: ApiResponse<[GetHospitalResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetHospitalResult]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/hospital/list"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<[GetHospitalResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetHospitalResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetHospitalResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetHospitalResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    
    /*
    //MARK: - Get Banner
    class func getAnnouncements(hospitalId: Int, success:@escaping (_ response: ApiResponse<[GetAnnouncementResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetAnnouncementResult]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/list/\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<[GetAnnouncementResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetAnnouncementResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetAnnouncementResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetAnnouncementResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    /*
    //MARK: - Get Banner
    class func getAnnouncementDetail(announcementId: Int, success:@escaping (_ response: ApiResponse<GetAnnouncementDetailResult>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<GetAnnouncementDetailResult>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/\(announcementId)/details"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<GetAnnouncementDetailResult>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<GetAnnouncementDetailResult>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<GetAnnouncementDetailResult>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<GetAnnouncementDetailResult>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    */
    /*
    //MARK: - Get Our Units (OurUnits)
    class func getUnitCategoryList(hospitalId: Int, success:@escaping (_ response: ApiResponse<[GetUnitCategoryResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetUnitCategoryResult]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/unit-category/list/\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<[GetUnitCategoryResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetUnitCategoryResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetUnitCategoryResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetUnitCategoryResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    */
    /*
    //MARK: - Get Unit Sub Categories (UnitCategory)
    class func getUnitSubCategoryList(hospitalId: Int, unitCategoryId: Int, success:@escaping (_ response: ApiResponse<[GetUnitSubCategoryResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetUnitSubCategoryResult]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/unit-category/list/\(hospitalId)/\(unitCategoryId)/subCategories"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<[GetUnitSubCategoryResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetUnitSubCategoryResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetUnitSubCategoryResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetUnitSubCategoryResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    /*
    //MARK: - Get Doctors (StaffCategory)
    class func getDoctorList(hospitalId: Int, unitSubCategoryId: Int?, success:@escaping (_ response: ApiResponse<[GetDoctorResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetDoctorResult]>?) -> Void) -> Void {
        
        var url = Constant.Url.PAGE + "v1/doctor/list/\(hospitalId)"
        
        if unitSubCategoryId != nil {
            url = Constant.Url.PAGE + "v1/doctor/list/\(hospitalId)/\(unitSubCategoryId!)"
        }
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<[GetDoctorResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetDoctorResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetDoctorResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetDoctorResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    /*
    //MARK: - Register
    class func register(deviceTokenId: String?, firstName: String, lastName: String, email: String, confirmEmail: String, birthYear: String, fatherName: String, password: String, confirmPassword: String, success:@escaping (_ response: ApiResponse<GetRegisterResult>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<GetRegisterResult>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/register"
        
        let parametre = ["deviceTokenId": deviceTokenId as AnyObject,
                         "firstName": firstName as AnyObject,
                         "lastName": lastName as AnyObject,
                         "email": email as AnyObject,
                         "confirmEmail": confirmEmail as AnyObject,
                         "birthYear": birthYear as AnyObject,
                         "fatherName": fatherName as AnyObject,
                         "password": password as AnyObject,
                         "confirmPassword": confirmPassword as AnyObject]
        
        BaseNetworkManager.post(url: url, parameters: parametre, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<GetRegisterResult>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<GetRegisterResult>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<GetRegisterResult>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<GetRegisterResult>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    /*
    //MARK: - Sign In
    class func signIn(email: String, password: String, success:@escaping (_ response: ApiResponse<GetSignInResult>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<GetSignInResult>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/authentication/sign-in"
        
        let parametre = ["email": email as AnyObject,
                         "password": password as AnyObject]
        
        BaseNetworkManager.post(url: url, parameters: parametre, headers: getHeaderWithoutToken(), success: { (data) in

            var theResponse : ApiResponse<GetSignInResult>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<GetSignInResult>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<GetSignInResult>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<GetSignInResult>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
    */
    /*
    //MARK: - Doctor Availability Times
    class func getAvailabilityTimes(appointmentDate: String, hospitalId: Int, doctorId: Int, success:@escaping (_ response: ApiResponse<[GetAvailabilityTimes]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetAvailabilityTimes]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/appointment/availability-times/\(appointmentDate)/\(hospitalId)/\(doctorId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeader(), success: { (data) in

            var theResponse : ApiResponse<[GetAvailabilityTimes]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetAvailabilityTimes]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetAvailabilityTimes]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetAvailabilityTimes]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }
 */
    /*
    //MARK: - Doctor Availability Times
    class func createAppointment(hospitalId: Int, doctorId: Int, appointmentDate: String, appointmentTime: String, success:@escaping (_ response: SuccessResponse) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: SuccessResponse?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/appointment/create"
        
        let parametre = ["hospitalId": hospitalId as AnyObject,
                         "doctorId": doctorId as AnyObject,
                         "appointmentDate": appointmentDate as AnyObject,
                         "appointmentTime": appointmentTime as AnyObject]
        
        BaseNetworkManager.post(url: url, parameters: parametre, headers: getHeader(), success: { (data) in

            var theResponse : SuccessResponse

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(SuccessResponse.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : SuccessResponse
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(SuccessResponse.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/
    /*
    //MARK: - Doctor Availability Times
    class func getAppointmentList(hospitalId: Int, success:@escaping (_ response: ApiResponse<[GetAppointmentResult]>) -> Void, failure:@escaping (_ error:Error, _ statusCode:Int, _ errorResponse: ApiResponse<[GetAppointmentResult]>?) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/appointment/list?hospitalId=\(hospitalId)"
        
        BaseNetworkManager.get(url: url, parameters: nil, headers: getHeader(), success: { (data) in

            var theResponse : ApiResponse<[GetAppointmentResult]>

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(ApiResponse<[GetAppointmentResult]>.self, from: data!)
                success(theResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: -1)
                failure(error, -1, nil)
            }

        }) { (Error, StatusCode, ErrorData) in
            
            var theErrorResponse : ApiResponse<[GetAppointmentResult]>
            
            do {
                let decoder = JSONDecoder()
                theErrorResponse = try decoder.decode(ApiResponse<[GetAppointmentResult]>.self, from: ErrorData!)
                printAndShowError(url: url, error: Error, statusCode: StatusCode)
                failure(Error, StatusCode, theErrorResponse)
            } catch let error {
                printAndShowError(url: url, error: error, statusCode: StatusCode)
                failure(error, StatusCode, nil)
            }
            
        }
    }*/

}
