//
//  AnnouncementDetailViewModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class AnnouncementDetailViewModel: BaseViewModel {
    
    class func getAnnouncementDetail(announcementId: Int, complation: @escaping(_ announcementList: GetAnnouncementDetailResult) -> Void, failure: @escaping(_ message: String) -> Void) -> Void {
        
        let url = Constant.Url.PAGE + "v1/announcement/\(announcementId)/details"
        let model = ApiResponse<GetAnnouncementDetailResult>.self
        
        
        BaseRemoteDataManager.request(url, method: .get, parameters: nil, headers: Helper.getHeaderWithoutToken(), type: model) { (announcementDetail) in
            if let error = announcementDetail.isError, error == true{
                failure(announcementDetail.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = announcementDetail.result{
                complation(data)
            }
        } failure: { (error, statusCode, errorResponse) in
            
            failure(errorResponse?.responseException?.message ?? "an_unexpected_error_occurred".localizable())
        }
        
    }

}
