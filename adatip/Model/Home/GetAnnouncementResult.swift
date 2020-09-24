//
//  GetAnnouncementResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAnnouncementResult: Codable {
    let id: Int?
    let hospitalId: Int?
    let title: String?
    let imageUrl: String?
    let shortDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case hospitalId = "hospitalId"
        case title = "title"
        case imageUrl = "imageUrl"
        case shortDescription = "shortDescription"
    }
}
