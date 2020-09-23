//
//  OurUnitsViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OurUnitsViewModel: BaseViewModel {
    
    class func getUnitCategoryList(hospitalId: Int, complation: @escaping(_ ourUnitList: [GetUnitCategoryResult]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        NetworkManager.getUnitCategoryList(hospitalId: hospitalId, success: { (ourUnit) in
            
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
