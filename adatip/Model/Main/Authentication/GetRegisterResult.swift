//
//  SetRegisterResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetRegisterResult: Codable {
    let customerId: Int?
    let customerGuid: String?
    let deviceTokenId: String?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let email: String?
    let roles : [GetUserRoles]?
    
    enum CodingKeys: String, CodingKey {
        case customerId = "customerId"
        case customerGuid = "customerGuid"
        case deviceTokenId = "deviceTokenId"
        case firstName = "firstName"
        case lastName = "lastName"
        case fullName = "fullName"
        case email = "email"
        case roles = "roles"
    }
}
