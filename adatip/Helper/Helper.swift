//
//  Helper.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    // MARK: *** Setup TabBar Controller
    class func setupTabBarControler(tabBarController: UITabBarController) {
        
        tabBarController.tabBar.unselectedItemTintColor = UIColor.customColorBlack.withAlphaComponent(0.4)
        tabBarController.tabBar.tintColor = UIColor.primaryColor
        tabBarController.tabBar.barTintColor = UIColor.secondaryColor
        
        for i in 0 ..< Config.applicationTabBarCount  {
            var tabBarItem = UITabBarItem()
            if i == 2{
                tabBarItem = UITabBarItem.init(title: nil, image: nil, tag: i)
            }else {
                tabBarItem = UITabBarItem.init(title: nil, image: UIImage.init(named: "tabBarIcon\(i)"), tag: i)
            }
            
            if UIDevice.current.userInterfaceIdiom != .pad{
                tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -5, right: 0)
            }
            tabBarController.viewControllers![i].tabBarItem = tabBarItem
            
        }
        
    }
    
    class func getFirstThirtyDay()-> [String]{
        
        var dates: [String] = []
        var date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for _ in 0...29 {
            dates.append(dateFormatter.string(from: date))
            date = date.addingTimeInterval(86400)
        }
        /*
        for item in dates {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            let dateObj = dateFormatter.date(from: item)!
            print(dateFormatter.string(from: dateObj))
        }*/
        
        return dates
    }
    
    class func signIn(email: String, fullName: String, accessToken: String, refreshToken: String){
        UserDefaults.standard.set(true, forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN)
        UserDefaults.standard.set(email, forKey: Constant.UserDefaults.EMAIL)
        UserDefaults.standard.set(fullName, forKey: Constant.UserDefaults.FULL_NAME)
        UserDefaults.standard.set(accessToken, forKey: Constant.UserDefaults.ACCESS_TOKEN)
        UserDefaults.standard.set(refreshToken, forKey: Constant.UserDefaults.REFRESH_TOKEN)
    }
    
    class func signOut(){
        UserDefaults.standard.set(false, forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.EMAIL)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.FULL_NAME)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.ACCESS_TOKEN)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.REFRESH_TOKEN)
    }
    
    
}
