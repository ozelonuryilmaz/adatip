//
//  HomeViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {
    
    class func getAnnouncements(hospitalId: Int, complation: @escaping(_ announcementList: [GetAnnouncementResult]) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/list/\(hospitalId)"
        let model = ApiResponse<[GetAnnouncementResult]>.self
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeaderWithoutToken(), type: model) { (announcement) in
            
            if let error = announcement.isError, error == true{
                failure(announcement.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = announcement.result{
                complation(data)
            }
            
        } failure: { (error, statusCode, errorResponse) in
            failure(errorResponse?.exceptionMessage ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
