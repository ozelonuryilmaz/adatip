//
//  GetSignInResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetSignInResult: Codable {
    let customerId: Int?
    let customerGuid: String?
    let deviceTokenId: String?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let email: String?
    let created: String?
    let updated: String?
    let accessToken: String?
    let role : String?
    
    enum CodingKeys: String, CodingKey {
        case customerId = "customerId"
        case customerGuid = "customerGuid"
        case deviceTokenId = "deviceTokenId"
        case firstName = "firstName"
        case lastName = "lastName"
        case fullName = "fullName"
        case created = "created"
        case updated = "updated"
        case email = "email"
        case accessToken = "accessToken"
        case role = "role"
    }
}
