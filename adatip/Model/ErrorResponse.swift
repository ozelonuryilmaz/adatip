//
//  ErrorResponse.swift
//  adatip
//
//  Created by Onur Yılmaz on 5.12.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let version: String?
    let statusCode: Int?
    let isError: Bool?
    let responseException: ResponseException?
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case statusCode = "statusCode"
        case isError = "isError"
        case responseException = "responseException"
    }
    
}
