//
//  GetAccessToken.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAccessToken: Codable {
    let accessToken: String?
    let expiration: String?
    let refreshToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case expiration = "expiration"
        case refreshToken = "refreshToken"
    }
}
