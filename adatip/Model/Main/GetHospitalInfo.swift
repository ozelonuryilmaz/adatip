//
//  GetHospitalInfo.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetHospitalInfo: Codable {
    let description: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case imageUrl = "imageUrl"
    }
    
}
