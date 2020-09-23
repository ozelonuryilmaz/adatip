//
//  MyNotifications.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class MyNotifications: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "notifications")
        
    }
    
}

extension MyNotifications{
    
    static let reuseId = "myNotifications"
    
    static func create() -> UIViewController{
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let announcementDetail = mainStoryBoard.instantiateViewController(withIdentifier: reuseId) as! MyNotifications
        
        return announcementDetail
    }
}
