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
        
        NetworkManager.createAppointment(hospitalId: __hospitalId, doctorId: __doctorId, appointmentDate: appointmentDate, appointmentTime: appointmentTime, success: { (appointment) in
            
            if let error = appointment.isError, error == true{
                failure(appointment.message ?? "an_unexpected_error_occurred".localizable())
            }else {
                complation(true)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

}
