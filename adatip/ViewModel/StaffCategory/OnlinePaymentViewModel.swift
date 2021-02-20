//
//  OnlinePaymentViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 7.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OnlinePaymentViewModel: BaseViewModel {
    
    class func createAppointment(__hospitalId: Int, __doctorId: Int, appointmentDate: String, appointmentTime: String, complation: @escaping(_ succes: Bool) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/appointment/create"
        let model = SuccessResponse.self
        
        let parametre = ["hospitalId": __hospitalId as AnyObject,
                         "doctorId": __doctorId as AnyObject,
                         "appointmentDate": appointmentDate as AnyObject,
                         "appointmentTime": appointmentTime as AnyObject]
        
        BaseRemoteDataManager.request(url, method: .post, parameters: parametre, headers: Helper.getHeader(), type: model) { (appointment) in
            
            if let error = appointment.isError, error == true{
                failure(appointment.message ?? "an_unexpected_error_occurred".localizable())
            }else {
                complation(true)
            }
            
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
