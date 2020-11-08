//
//  Date + Extension.swift
//  adatip
//
//  Created by Onur YILMAZ on 4.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension Date {
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func convertDateToString(formatValue: String = "dd-MM-yyyy") -> String{
            let formatter = DateFormatter()
            formatter.dateFormat = formatValue
            
            return formatter.string(from: self)
        }
    
}
