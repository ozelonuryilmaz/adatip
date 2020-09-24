//
//  GetUnitSubCategoryResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetUnitSubCategoryResult: Codable {
    let id: Int?
    let unitCategoryId: Int?
    let subCategoryName: String?
    let imageUrl: String?
    let unitDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case unitCategoryId = "unitCategoryId"
        case subCategoryName = "subCategoryName"
        case imageUrl = "imageUrl"
        case unitDescription = "unitDescription"
    }
}

