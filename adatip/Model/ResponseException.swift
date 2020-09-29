//
//  ResponseException.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct ResponseException: Codable {
    
    let exceptionMessage: String?
    let validationErrors: [ValidationError]?
    
    enum CodingKeys: String, CodingKey {
        case exceptionMessage = "exceptionMessage"
        case validationErrors = "validationErrors"
    }
}
