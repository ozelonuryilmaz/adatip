//
//  GetAppointmentResult.swift
//  adatip
//
//  Created by Onur YILMAZ on 8.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import Foundation

struct GetAppointmentResult: Codable {
    let appointmentId: Int?
    let customerId: Int?
    let hospitalId: Int?
    let doctorId: Int?
    let unitSubCategoryId: Int?
    let appointmentTimeId: Int?
    let appointmentStatusId: Int?
    let customer: String?
    let customerEmail: String?
    let hospital: String?
    let unit: String?
    let appointmentDate: String?
    let appointmentTime: String?
    let doctor: String?
    let doctorEmail: String?
    
    enum CodingKeys: String, CodingKey {
        case appointmentId = "appointmentId"
        case customerId = "customerId"
        case hospitalId = "hospitalId"
        case doctorId = "doctorId"
        case unitSubCategoryId = "unitSubCategoryId"
        case appointmentTimeId = "appointmentTimeId"
        case appointmentStatusId = "appointmentStatusId"
        case customer = "customer"
        case customerEmail = "customerEmail"
        case hospital = "hospital"
        case unit = "unit"
        case appointmentDate = "appointmentDate"
        case appointmentTime = "appointmentTime"
        case doctor = "doctor"
        case doctorEmail = "doctorEmail"
    }
}
