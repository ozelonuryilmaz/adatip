//
//  GetUnitCategoryResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetUnitCategoryResult: Codable {
    let unitCategoryId: Int?
    let hospitalId: Int?
    let categoryName: String?
    let shortDescription: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case unitCategoryId = "unitCategoryId"
        case hospitalId = "hospitalId"
        case categoryName = "categoryName"
        case shortDescription = "shortDescription"
        case imageUrl = "imageUrl"
    }
}
