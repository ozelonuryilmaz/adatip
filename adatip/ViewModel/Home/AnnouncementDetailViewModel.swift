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
        
        NetworkManager.getAnnouncementDetail(announcementId: announcementId, success: { (announcementDetail) in
            
            if let error = announcementDetail.isError, error == true{
                failure(announcementDetail.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = announcementDetail.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

}
