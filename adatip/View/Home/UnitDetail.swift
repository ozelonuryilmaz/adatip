//
//  UnitDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 25.10.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitDetail: BaseViewController {
    
    var unitTitle = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: unitTitle, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
    }

}

extension UnitDetail{
    
    static let reuseId = "unitDetail"
    
    static func create(unitTitle: String) -> UIViewController{
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: .main)
        let unitDetail = homeStoryBoard.instantiateViewController(withIdentifier: reuseId) as! UnitDetail
        unitDetail.unitTitle = unitTitle
        
        return unitDetail
    }
}
