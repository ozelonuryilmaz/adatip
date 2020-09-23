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
        
        tabBarController.tabBar.unselectedItemTintColor = UIColor.customColorBlack.withAlphaComponent(0.5)
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
    
    
}
