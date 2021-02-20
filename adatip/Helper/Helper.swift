//
//  Helper.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import Alamofire

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
        var date = Date().addingTimeInterval(25200) //17.00
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for _ in 0...30 {
            if date.dayNumberOfWeek() != 1{
                dates.append(dateFormatter.string(from: date))
            }
            
            date = date.addingTimeInterval(86400)
        }
        
        return dates
    }
    
    class func getHeader() -> HTTPHeaders {
        
        let token = UserDefaults.standard.string(forKey: Constant.UserDefaults.ACCESS_TOKEN) ?? ""
        let header : HTTPHeaders = ["Authorization": "Bearer " + token, "Content-Type": "application/json"]
        
        return header
    }
    
    class func getHeaderWithoutToken() -> HTTPHeaders {
        
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        return header
    }
    
    class func printAndShowError(url: String, error: Error, statusCode: Int) {
        print("***ERROR***\nurl = \(url)\nstatusCode = \(statusCode)\nlocalized = \(error.localizedDescription)\nerror = \(error)\n")
    }
    
    class func signIn(email: String, fullName: String, accessToken: String, refreshToken: String, role: String){
        UserDefaults.standard.set(true, forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN)
        UserDefaults.standard.set(email, forKey: Constant.UserDefaults.EMAIL)
        UserDefaults.standard.set(fullName, forKey: Constant.UserDefaults.FULL_NAME)
        UserDefaults.standard.set(accessToken, forKey: Constant.UserDefaults.ACCESS_TOKEN)
        UserDefaults.standard.set(refreshToken, forKey: Constant.UserDefaults.REFRESH_TOKEN)
        UserDefaults.standard.set(role, forKey: Constant.UserDefaults.USER_ROLE)
    }
    
    class func signOut(){
        UserDefaults.standard.set(false, forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.EMAIL)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.FULL_NAME)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.ACCESS_TOKEN)
        UserDefaults.standard.removeObject(forKey: Constant.UserDefaults.REFRESH_TOKEN)
    }
    
    
}
