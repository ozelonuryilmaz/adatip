//
//  MainTabBarController.swift
//  adatip
//
//  Created by Onur YILMAZ on 19.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var image: UIImageView?
    private var centerButton = UIButton(type: .custom)
    
    private let coustmeTabBarView: UIView = {
        
        //  daclare coustmeTabBarView as view
        let view = UIView(frame: .zero)
        
        // to make the cornerRadius of coustmeTabBarView
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        view.clipsToBounds = true
        
        // to make the shadow of coustmeTabBarView
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        addcoustmeTabBarView()
        hideTabBarBorder()
        
        addCenterButton()
        
        //when the tab changed.
        NotificationCenter.default.addObserver(self, selector: #selector(self.tabBarPrimaryCenterButton), name: NSNotification.Name(rawValue: Constant.NotificationKeys.TABBAR_PRIMARY_CENTER_BUTTON), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.tabBarSecondaryCenterButton), name: NSNotification.Name(rawValue: Constant.NotificationKeys.TABBAR_SECONDARY_CENTER_BUTTON), object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        coustmeTabBarView.frame = tabBar.frame
        centerButtonFrame()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        /*var newSafeArea = UIEdgeInsets()
        
        // Adjust the safe area to the height of the bottom views.
        //newSafeArea.bottom += coustmeTabBarView.bounds.size.height
        
        // Adjust the safe area insets of the
        //  embedded child view controller.
        self.children.forEach({if #available(iOS 11.0, *) {
            $0.additionalSafeAreaInsets = newSafeArea
        } else {
            // Fallback on earlier versions
            }})*/
    }
    
    
    
    private func addcoustmeTabBarView() {
        //
        coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    
    private func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        
    }
    
    private func addCenterButton(){
        
        let image = UIImage(named: "tabBarIcon2") as UIImage?
        centerButton.setImage(image, for: .normal)
        centerButton.contentMode = .center
        centerButton.imageView?.contentMode = .scaleAspectFit
        
        centerButtonFrame()
        centerButton.backgroundColor = UIColor.secondaryColor
        centerButton.clipsToBounds = true
        centerButton.layer.cornerRadius = centerButton.frame.size.height / 2
        centerButton.adjustsImageWhenHighlighted = false
        
        centerButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        centerButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        centerButton.layer.shadowOpacity = 0.8
        centerButton.layer.shadowRadius = 2.0
        centerButton.layer.masksToBounds = false
        
        self.tabBar.addSubview(centerButton)
        self.tabBar.bringSubviewToFront(centerButton)
        //self.tabBar.insertSubview(bgView, at: 0) //-> Add Background View
        
        centerButton.addTarget(self, action: #selector(didTouchCenterButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func didTouchCenterButton(_ sender: AnyObject){
        centerButton.backgroundColor = UIColor.primaryColor
        self.selectedIndex = 2
    }
    
    private func centerButtonFrame(){
        let tabBarItemHeight: CGFloat = 48
        let itemIndex: CGFloat = 2
        let itemWidth: CGFloat = self.tabBar.frame.width / CGFloat(Config.applicationTabBarCount)
        let square: CGFloat = tabBarItemHeight - 2//self.tabBar.frame.size.height - 2

        let buttonWidth = itemWidth - square
        
        centerButton.frame = CGRect(x: itemWidth * itemIndex + buttonWidth / 2 + 1, y: 1, width: square, height: square)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex != 2 {
            centerButton.backgroundColor = UIColor.secondaryColor
        }else{
            centerButton.backgroundColor = UIColor.primaryColor
        }
    }
    
    @objc private func tabBarPrimaryCenterButton(){
        centerButton.backgroundColor = UIColor.primaryColor
    }
    
    @objc private func tabBarSecondaryCenterButton(){
        centerButton.backgroundColor = UIColor.secondaryColor
    }
}
