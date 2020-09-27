//
//  Settings.swift
//  adatip
//
//  Created by Onur YILMAZ on 27.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Settings: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "settings")
        
        
    }

}

extension Settings{
    
    static let reuseId = "settings"
    
    static func create() -> UIViewController{
        let profileStoryBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: .main)
        let settings = profileStoryBoard.instantiateViewController(withIdentifier: reuseId) as! Settings
        
        return settings
    }
}
