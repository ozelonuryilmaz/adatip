//
//  OurUnits.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OurUnits: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "our_units", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "our_units", subtitle: "(" + self.hospitalTitle + ")")
        
    }
    
}
