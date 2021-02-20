//
//  HospitalListViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class HospitalListViewModel: BaseViewModel {
    
    class func getHospitalList(complation: @escaping(_ hospitalList: [GetHospitalResult]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/hospital/list"
        let model = ApiResponse<[GetHospitalResult]>.self
        
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeaderWithoutToken(), type: model) { (hospitals) in
            
            if let error = hospitals.isError, error == true{
                failure(hospitals.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = hospitals.result{
                complation(data)
            }
            
        } failure: { (error, statusCode, errorResponse) in
            failure(errorResponse?.exceptionMessage ?? "an_unexpected_error_occurred".localizable())
        }
        
        /*
        NetworkManager.getHospitalList(success: { (hospitals) in
            
            if let error = hospitals.isError, error == true{
                failure(hospitals.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = hospitals.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }*/
    }

}
