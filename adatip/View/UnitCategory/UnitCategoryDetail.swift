//
//  UnitCategoryDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitCategoryDetail: BaseViewController {
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

extension UnitCategoryDetail{
    static let reuseId = "unitCategoryDetail"
    
    static func create(titleName: String) -> UIViewController{
        let unitCategoryStoryBoard: UIStoryboard = UIStoryboard(name: "UnitCategory", bundle: .main)
        let unitCategoryDetail = unitCategoryStoryBoard.instantiateViewController(withIdentifier: reuseId) as! UnitCategoryDetail
        unitCategoryDetail.titleName = titleName
        
        return unitCategoryDetail
    }
}
