//
//  SuccessResponse.swift
//  adatip
//
//  Created by Onur YILMAZ on 7.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct SuccessResponse: Codable {
    let version: String?
    let statusCode: Int?
    let message: String?
    let isError: Bool?
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case statusCode = "statusCode"
        case message = "message"
        case isError = "isError"
    }
    
}
