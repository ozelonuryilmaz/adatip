//
//  ProfileViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 8.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class ProfileViewModel: BaseViewModel {
    
    class func getAppointmentList(hospitalId: Int, complation: @escaping(_ availabilityTimeList: [GetAppointmentResult]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/customer/appointment/list?hospitalId=\(hospitalId)"
        let model = ApiResponse<[GetAppointmentResult]>.self
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeader(), type: model) { (appointmentList) in
            
            if let error = appointmentList.isError, error == true{
                failure(appointmentList.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = appointmentList.result{
                complation(data)
            }
            
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
