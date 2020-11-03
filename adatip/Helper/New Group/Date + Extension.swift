//
//  Date + Extension.swift
//  adatip
//
//  Created by Onur YILMAZ on 3.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension Date {
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
}
