//
//  UnitCategory.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitCategory: BaseViewController {
    
    var titleName = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
    }
    
}

extension UnitCategory{
    static let reuseId = "unitCategory"
    
    static func create(titleName: String) -> UIViewController{
        let unitCategoryStoryBoard: UIStoryboard = UIStoryboard(name: "UnitCategory", bundle: .main)
        let unitCategory = unitCategoryStoryBoard.instantiateViewController(withIdentifier: reuseId) as! UnitCategory
        unitCategory.titleName = titleName
        
        return unitCategory
    }
}
