//
//  GetUserRoles.swift
//  adatip
//
//  Created by Onur YILMAZ on 29.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetUserRoles: Codable {
    let roleId: Int?
    let roleName: String?
    
    enum CodingKeys: String, CodingKey {
        case roleId = "roleId"
        case roleName = "roleName"
    }
}
