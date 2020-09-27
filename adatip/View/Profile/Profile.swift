//
//  Profile.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Profile: BaseViewController {
    
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewMyProfileIcon: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "my_profile")
        
        let btnSettings = UIButton(type: .custom)
        btnSettings.setImage(UIImage(named: "gear"), for: .normal)
        btnSettings.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnSettings.addTarget(self, action: #selector(tapBtnSettings(sender:)), for: .touchUpInside)
        let settingsBarButtonItem = UIBarButtonItem(customView: btnSettings)
        self.navigationItem.rightBarButtonItem = settingsBarButtonItem
        
        viewProfile.layerGradient()
        
        viewMyProfileIcon.clipsToBounds = true
        viewMyProfileIcon.layer.cornerRadius = viewMyProfileIcon.frame.size.height / 2
        viewMyProfileIcon.backgroundColor = UIColor.secondaryColor
        
    }
    
    //MARK: *** Bar Button Action
    @IBAction func tapBtnSettings(sender: UIButton){
        self.navigationController?.pushViewController(Settings.create(), animated: true)
    }
    
}
