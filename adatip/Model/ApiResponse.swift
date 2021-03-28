//
//  ApiResponse.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct ApiResponse<T : Codable>: Codable {
    let total: Int?
    let result: T?
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case result = "result"
    }
    
}
