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
        
        
        let url = Constant.Url.PAGE + "v1/appointment/availability-times/\(appointmentDate)/\(hospitalId)/\(doctorId)"
        let model = ApiResponse<[GetAvailabilityTimes]>.self
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeader(), type: model) { (availabilityTimeList) in
            
            if let data = availabilityTimeList.result{
                complation(data)
            }
            
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
