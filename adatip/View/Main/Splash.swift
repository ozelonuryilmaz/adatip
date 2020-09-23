//
//  Splash.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Splash: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("SplashVM -> \(SplashViewModel.shared.nums)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Thread.sleep(forTimeInterval: 2)
        
        openApp()
    }
    
    private func openApp(){
        
        if UserDefaults.standard.object(forKey: Constant.UserDefaults.HOSPITAL_ID) == nil {
            
            let hospitalList = HospitalList.create(firstTime: true)
            let hospitalListNav = UINavigationController(rootViewController: hospitalList)
            hospitalListNav.modalPresentationStyle = .fullScreen
            hospitalListNav.modalTransitionStyle = .crossDissolve
            self.present(hospitalListNav, animated: true, completion: nil)
            
        }else {
            
            let mainView: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = mainView.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
            mainTabBarController.modalPresentationStyle = .fullScreen
            mainTabBarController.modalTransitionStyle = .crossDissolve
            self.present(mainTabBarController, animated: true, completion: nil)
            
            Helper.setupTabBarControler(tabBarController: mainTabBarController)
            
        }
        
    }
    
}
