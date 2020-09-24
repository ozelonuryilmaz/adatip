//
//  GetDoctorResultDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 24.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetDoctorResultDetail: Codable {
    let doctorId: Int?
    let yearOfBirth: Int?
    let languages: String?
    let education: String?
    let experience: String?
    let article: String?
    let memberships: String?
    let courses: String?
    let certifications: String?
    let resume: String?
    
    
    enum CodingKeys: String, CodingKey {
        case doctorId = "doctorId"
        case yearOfBirth = "yearOfBirth"
        case languages = "languages"
        case education = "education"
        case experience = "experience"
        case article = "article"
        case memberships = "memberships"
        case courses = "courses"
        case certifications = "certifications"
        case resume = "resume"
        
    }
}
