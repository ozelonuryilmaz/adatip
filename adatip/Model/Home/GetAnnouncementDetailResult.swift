//
//  GetAnnouncementDetailResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAnnouncementDetailResult: Codable {
    let id: Int?
    let hospitalId: Int?
    let announcementId: Int?
    let fullDescription: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case hospitalId = "hospitalId"
        case announcementId = "announcementId"
        case fullDescription = "fullDescription"
        case imageUrl = "imageUrl"
    }
}
