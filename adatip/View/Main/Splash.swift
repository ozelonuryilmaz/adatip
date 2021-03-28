//
//  Splash.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import FirebaseMessaging

class Splash: BaseViewController {
    
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
        
        //print("Splash VM -> \(SplashViewModel.shared.nums)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.object(forKey: Constant.UserDefaults.HOSPITAL_ID) == nil {
            createGuest(UIDevice.current.identifierForVendor?.uuidString ?? "")
        }else {
            openApp()
        }
    }
    
    private func openApp(){
        
        Thread.sleep(forTimeInterval: 1)
        
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
    
    private func createGuest(_ deviceTokenId: String){
        
        indicatorView.startAnimating()
        SplashViewModel.createGuest(deviceTokenId: deviceTokenId, complation: { (hospitalList) in
            
            self.openApp()
        }) { (errorMessage) in
            self.openApp()
        }
    }
    
}
