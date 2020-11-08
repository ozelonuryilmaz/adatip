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
        
        NetworkManager.getDoctorList(hospitalId: hospitalId, unitSubCategoryId: unitSubCategoryId, success: { (ourUnit) in
            
            if let error = ourUnit.isError, error == true{
                failure(ourUnit.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = ourUnit.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

}
