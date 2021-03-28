//
//  StaffCategoryViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 24.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategoryViewModel: BaseViewModel {
    
    class func getDoctorList(hospitalId: Int, unitSubCategoryId: Int?, complation: @escaping(_ ourUnitList: [GetDoctorResult]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        
        var url = Constant.Url.PAGE + "v1/doctor/list/\(hospitalId)"
        
        if unitSubCategoryId != nil {
            url = Constant.Url.PAGE + "v1/doctor/list/\(hospitalId)/\(unitSubCategoryId!)"
        }
        
        let model = ApiResponse<[GetDoctorResult]>.self
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeaderWithoutToken(), type: model) { (ourUnit) in
            
            if let data = ourUnit.result{
                complation(data)
            }
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
