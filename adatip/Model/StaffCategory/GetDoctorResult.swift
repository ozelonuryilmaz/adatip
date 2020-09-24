//
//  GetDoctorResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 24.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetDoctorResult: Codable {
    let doctorId: Int?
    let hospitalId: Int?
    let unitSubCategoryId: Int?
    let profession: String?
    let title: String?
    let fullName: String?
    let firstName: String?
    let lastName: String?
    let imageUrl: String?
    let detail: GetDoctorResultDetail?
    
    enum CodingKeys: String, CodingKey {
        case doctorId = "doctorId"
        case hospitalId = "hospitalId"
        case unitSubCategoryId = "unitSubCategoryId"
        case profession = "profession"
        case title = "title"
        case fullName = "fullName"
        case firstName = "firstName"
        case lastName = "lastName"
        case imageUrl = "imageUrl"
        case detail = "detail"
    }
}
