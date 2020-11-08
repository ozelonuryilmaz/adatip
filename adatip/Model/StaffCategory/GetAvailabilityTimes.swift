//
//  GetAvailabilityTimes.swift
//  adatip
//
//  Created by Onur YILMAZ on 6.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAvailabilityTimes: Codable {
    let timeOfDay: String?
    let isAvailable: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case timeOfDay = "timeOfDay"
        case isAvailable = "isAvailable"
        
    }
}
