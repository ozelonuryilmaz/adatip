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
        
        NetworkManager.getAnnouncements(hospitalId: hospitalId, success: { (announcement) in
            
            if let error = announcement.isError, error == true{
                failure(announcement.message ?? "an_unexpected_error_occurred".localizable())
            }
            
            if let data = announcement.result{
                complation(data)
            }
            
        }) { (error, statusCode, errorResponse) in
            failure(errorResponse?.message ?? "an_unexpected_error_occurred".localizable())
        }
    }

}
