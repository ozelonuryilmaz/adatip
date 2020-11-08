//
//  StaffCategoryViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 24.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class DoctorViewModel: BaseViewModel {
    
    class func getAvailabilityTimes(appointmentDate: String, hospitalId: Int, doctorId: Int, complation: @escaping(_ availabilityTimeList: [GetAvailabilityTimes]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        NetworkManager.getAvailabilityTimes(appointmentDate: appointmentDate, hospitalId: hospitalId, doctorId: doctorId, success: { (availabilityTimeList) in
            
            if let error = availabilityTimeList.isError, error == true{
                failure(availabilityTimeList.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = availabilityTimeList.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

}
