//
//  OurUnits + TableViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension OurUnits: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ourUnitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OurUnitsCell.reuseID, for: indexPath) as? OurUnitsCell else {
            return UITableViewCell()
        }
        
        cell.setOurUnitList(ourUnit: self.ourUnitArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ourUnit = self.ourUnitArray[indexPath.row]
        
        let unitCategory = UnitCategory.create(titleName: ourUnit.categoryName ?? "",
                                               unitCategoryId: ourUnit.unitCategoryId!)
        self.navigationController?.pushViewController(unitCategory, animated: true)
    }
    
}
