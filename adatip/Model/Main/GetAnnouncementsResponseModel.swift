//
//  GetAnnouncementsResponseModel.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAnnouncementsResponseModel: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let isError: Bool?
    let responseException: ResponseException?
    
    let result: [GetAnnouncementResult]?
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case statusCode = "statusCode"
        case message = "message"
        case isError = "isError"
        case responseException = "responseException"
        
        case result = "result"
    }
    
}
