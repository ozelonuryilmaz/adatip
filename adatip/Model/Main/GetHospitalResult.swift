//
//  GetHospitalResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetHospitalResult: Codable {
    let hospitalId: Int?
    let title: String?
    let code: String?
    let shortName: String?
    let description: String?
    let imageUrl: String?
    let detail: GetHospitalInfo?
    
    enum CodingKeys: String, CodingKey {
        case hospitalId = "hospitalId"
        case title = "title"
        case code = "code"
        case shortName = "shortName"
        case description = "description"
        case imageUrl = "imageUrl"
        case detail = "Detail"
    }
}
