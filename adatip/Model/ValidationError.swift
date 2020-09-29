//
//  ValidationError.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct ValidationError: Codable {
    let name: String?
    let reason: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case reason = "reason"
    }
}
