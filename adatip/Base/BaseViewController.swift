//
//  BaseViewController.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var hospitalId = Int()
    var hospitalTitle = String()
    
    private var window = UIWindow(frame: UIScreen.main.bounds)
    private var containerView = UIView()
    private var progressView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
    private var progressForView = UIView()
    private var activityIndicatorForView = UIActivityIndicatorView()
    
    private let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: 0, height: 0))
    private let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 16, width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        hospitalTitle = UserDefaults.standard.string(forKey: Constant.UserDefaults.HOSPITALL_TITLE) ?? "AdaTıp"
        if let id = UserDefaults.standard.object(forKey: Constant.UserDefaults.HOSPITAL_ID) {
            hospitalId = id as! Int
        }else {
            hospitalId = UserDefaults.standard.integer(forKey: Constant.UserDefaults.HOSPITAL_ID)
        }
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospitalInfo), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL_INFO), object: nil)
        
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        containerView.frame = window.frame
        containerView.center = window.center
        progressView.center = window.center
        
    }
    
    @objc private func changeHospitalInfo(){
        self.hospitalId = UserDefaults.standard.integer(forKey: Constant.UserDefaults.HOSPITAL_ID)
        self.hospitalTitle = UserDefaults.standard.string(forKey: Constant.UserDefaults.HOSPITALL_TITLE) ?? "AdaTıp"
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func initBarButtonNotification() {
        
        let btnNotification = UIButton(type: .custom)
        btnNotification.setImage(UIImage(named: "bell"), for: .normal)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnNotification.addTarget(self, action: #selector(tapBtnNotification(sender:)), for: .touchUpInside)
        let notificationBarButtonItem = UIBarButtonItem(customView: btnNotification)
        self.navigationItem.rightBarButtonItem = notificationBarButtonItem
    }
    
    //MARK: *** Bar Button Action
    @IBAction func tapBtnNotification(sender: UIButton){
        self.navigationController?.pushViewController(MyNotifications.create(), animated: true)
    }
    
    // MARK: *** Setup Navigation Controller
    func setupNavigationBar(titleName: String, subtitle: String? = nil) {
        
        //Setup NavigationController
        if self.navigationController != nil {
            
            self.navigationController!.navigationBar.barTintColor = UIColor.customColorWhite
            self.navigationController!.navigationBar.tintColor = UIColor.secondaryColor
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            //self.navigationItem.leftBarButtonItem = nil
            
            if subtitle == nil {
                updateNavigationBarTitle(titleName: titleName)
            }else {
                updateNavigationBarTitle(withSubtitle: subtitle!, title: titleName)
            }
            
        }
    }
    
    private func updateNavigationBarTitle(titleName: String){
        
        let lblTitle = UILabel()
        lblTitle.text = titleName.localizable()
        lblTitle.font = UIFont.customFont(size: 17, customStyle: .Bold)
        lblTitle.textColor = UIColor.secondaryColor
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 1
        self.navigationItem.titleView = lblTitle
        
    }
    
    private func updateNavigationBarTitle(withSubtitle:String, title:String) {
        
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.secondaryColor
        titleLabel.font = UIFont.customFont(size: 17, customStyle: .Bold)
        titleLabel.text = title.localizable()
        titleLabel.sizeToFit()
        
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.secondaryColor
        subtitleLabel.font = UIFont.customFont(size: 13, customStyle: .Regular)
        subtitleLabel.text = withSubtitle.localizable()
        subtitleLabel.sizeToFit()

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)

        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }
        
        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabTitleViewTapped(sender:))))
        self.navigationItem.titleView = titleView
    }
    
    @objc private func tabTitleViewTapped(sender: UITapGestureRecognizer) {
        let hospitalList = HospitalList.create()
        let hospitalListNav = UINavigationController(rootViewController: hospitalList)
        self.present(hospitalListNav, animated: true, completion: nil)
    }
    
    func updateNavigationBarTitle(title:String, subtitle:String){
        self.titleLabel.text = title.localizable()
        self.subtitleLabel.text = subtitle.localizable()
    }
    
    
    // MARK: *** Activity Indicator View
    func showProgressView() {
        
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.isUserInteractionEnabled = true
        containerView.backgroundColor = UIColor.customColorBlack.withAlphaComponent(0.2)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = window.center
        progressView.backgroundColor = UIColor.customColorWhiteDarker
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.style = .whiteLarge
        activityIndicator.color = UIColor.customColorBlack
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: progressView.frame.size.width / 2,
                                           y: progressView.frame.size.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        
        UIApplication.shared.keyWindow?.addSubview(containerView) //viewDidAppear
        
        activityIndicator.startAnimating()
    }
    
    func hideProgressView() {
        DispatchQueue.main.async {
            self.activityIndicator.hide()
            self.progressView.removeFromSuperview()
            self.containerView.removeFromSuperview()
        }
    }
    
    func showProgressView(_ view: UIView){
        
        progressForView.frame = view.frame
        progressForView.center = view.center
        progressForView.isUserInteractionEnabled = true
        progressForView.backgroundColor = UIColor.clear
        
        activityIndicatorForView.style = .whiteLarge
        activityIndicatorForView.color = UIColor.textColorOnSecondary
        activityIndicatorForView.center = view.center
        
        progressForView.addSubview(activityIndicatorForView)
        view.addSubview(progressForView)
        
        activityIndicatorForView.startAnimating()
    }
    
    func hideProgressView(_ view: UIView){
        DispatchQueue.main.async {
            self.activityIndicatorForView.hide()
            self.progressForView.removeFromSuperview()
        }
    }
    
}
