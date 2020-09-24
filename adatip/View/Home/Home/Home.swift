//
//  Home.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import ImageSlideshow

class Home: BaseViewController {

    @IBOutlet weak var imgSlideshow: ImageSlideshow!
    @IBOutlet weak var bannerActivityIndicator: UIActivityIndicatorView!
    private var imageSourcesForBanner = Array <InputSource>()
    var banners : [GetAnnouncementResult] = []
    
    @IBOutlet weak var viewDesc: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var constraintTitle: NSLayoutConstraint!
    @IBOutlet weak var lblShortDesc: UILabel!
    
    @IBOutlet weak var viewCollection: UIView!
    @IBOutlet weak var viewDoctor: UIView!
    @IBOutlet weak var btnDoctor: UIButton!
    @IBOutlet weak var viewAppointment: UIView!
    @IBOutlet weak var btnAppointment: UIButton!
    
    @IBOutlet weak var viewOurHospitals: UIView!
    @IBOutlet weak var viewOurUnits: UIView!
    @IBOutlet weak var viewOurDoctors: UIView!
    @IBOutlet weak var viewOnlineServices: UIView!
    
    @IBOutlet weak var lblOurHosptials: UILabel!
    @IBOutlet weak var lblOurUnits: UILabel!
    @IBOutlet weak var lblOurDoctors: UILabel!
    @IBOutlet weak var lblOnlineServices: UILabel!
    
    @IBOutlet weak var collectionViewUnits: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        getBanners(hospitalId: self.hospitalId)
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "adatip", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        let btnLogo = UIImageView()
        btnLogo.image = UIImage(named: "maskgroup")
        btnLogo.contentMode = .center
        btnLogo.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let btnLogoConteinerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btnLogoConteinerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOurHospitalTapped(sender:))))
        btnLogoConteinerView.addSubview(btnLogo)
        let logoBarButtonItem = UIBarButtonItem(customView: btnLogoConteinerView)
        self.navigationItem.leftBarButtonItem = logoBarButtonItem
        
        imgSlideshow.backgroundColor = UIColor.customColorWhite
        imgSlideshow.slideshowInterval = 5
        imgSlideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
        imgSlideshow.activityIndicator = DefaultActivityIndicator.init(style: .whiteLarge, color: UIColor.secondaryColor)
        imgSlideshow.pageIndicatorPosition = PageIndicatorPosition.init(horizontal: .center, vertical: .under)
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.primaryColor
        pageControl.pageIndicatorTintColor = UIColor.secondaryColor
        imgSlideshow.pageIndicator = pageControl
        
        imgSlideshow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgSlideshowTapped(sender:))))
        imgSlideshow.currentPageChanged = { index in
            self.imageSlideShowPageChanged(index)
        }
        
        viewDesc.isUserInteractionEnabled = false
        viewDesc.backgroundColor = UIColor.secondaryColor.withAlphaComponent(0.8)
        
        lblTitle.font = UIFont.customFont(size: 16, customStyle: .Bold)
        lblTitle.textColor = UIColor.customColorWhite
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        
        lblShortDesc.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblShortDesc.textColor = UIColor.customColorWhite
        lblShortDesc.numberOfLines = 0
        lblShortDesc.sizeToFit()
        
        viewCollection.layerGradient()
        
        viewDoctor.backgroundColor = UIColor.primaryColor
        viewDoctor.clipsToBounds = true
        viewDoctor.layer.cornerRadius = viewDoctor.frame.size.height / 2
        viewDoctor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBtnConsultDoctor(sender:))))
        
        btnDoctor.setTitle("consult_doctor".localizable(), for: .normal)
        btnDoctor.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnDoctor.titleLabel?.font = UIFont.customFont(size: 12, customStyle: .Bold)
        btnDoctor.addTarget(self, action: #selector(tapBtnConsultDoctor(sender:)), for: .touchUpInside)
        
        viewAppointment.backgroundColor = UIColor.secondaryColor
        viewAppointment.clipsToBounds = true
        viewAppointment.layer.cornerRadius = viewDoctor.frame.size.height / 2
        viewAppointment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBtnAppointment(sender:))))
        
        btnAppointment.setTitle("new_appointment".localizable(), for: .normal)
        btnAppointment.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnAppointment.titleLabel?.font = UIFont.customFont(size: 12, customStyle: .Bold)
        btnAppointment.addTarget(self, action: #selector(tapBtnAppointment(sender:)), for: .touchUpInside)
        
        viewOurHospitals.clipsToBounds = true
        viewOurHospitals.layer.cornerRadius = 25
        viewOurHospitals.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewOurHospitals.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewOurHospitals.layer.shadowOpacity = 1.0
        viewOurHospitals.layer.shadowRadius = 10.0
        viewOurHospitals.layer.masksToBounds = false
        viewOurHospitals.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOurHospitalTapped(sender:))))
        
        lblOurHosptials.text = "our_hospitals".localizable()
        lblOurHosptials.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblOurHosptials.textColor = UIColor.secondaryColor
        
        viewOurUnits.clipsToBounds = true
        viewOurUnits.layer.cornerRadius = 25
        viewOurUnits.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewOurUnits.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewOurUnits.layer.shadowOpacity = 1.0
        viewOurUnits.layer.shadowRadius = 10.0
        viewOurUnits.layer.masksToBounds = false
        viewOurUnits.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOurUnitTapped(sender:))))
        
        lblOurUnits.text = "our_units".localizable()
        lblOurUnits.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblOurUnits.textColor = UIColor.secondaryColor
        
        viewOurDoctors.clipsToBounds = true
        viewOurDoctors.layer.cornerRadius = 25
        viewOurDoctors.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewOurDoctors.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewOurDoctors.layer.shadowOpacity = 1.0
        viewOurDoctors.layer.shadowRadius = 10.0
        viewOurDoctors.layer.masksToBounds = false
        viewOurDoctors.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOurDoctorTapped(sender:))))
        
        lblOurDoctors.text = "our_doctors".localizable()
        lblOurDoctors.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblOurDoctors.textColor = UIColor.secondaryColor
        
        viewOnlineServices.clipsToBounds = true
        viewOnlineServices.layer.cornerRadius = 25
        viewOnlineServices.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewOnlineServices.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewOnlineServices.layer.shadowOpacity = 1.0
        viewOnlineServices.layer.shadowRadius = 10.0
        viewOnlineServices.layer.masksToBounds = false
        viewOnlineServices.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnlineServiceTapped(sender:))))
        
        lblOnlineServices.text = "online_services".localizable()
        lblOnlineServices.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblOnlineServices.textColor = UIColor.secondaryColor
        
        collectionViewUnits.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionViewUnits.reloadData()
        
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "adatip", subtitle: "(" + self.hospitalTitle + ")")
        getBanners(hospitalId: self.hospitalId)
    }
    
    // MARK: *** Button Tap Action
    
    @IBAction func tapBtnConsultDoctor(sender: AnyObject){
        print("Doctor")
    }
    
    @IBAction func tapBtnAppointment(sender: AnyObject){
        print("Appointment")
    }
    
    // MARK: *** Tap Gesture Recognizer
    @objc private func imgSlideshowTapped(sender: UITapGestureRecognizer) {
        print("Tapped Banner Index: \(imgSlideshow.currentPage)")
        
        if banners[imgSlideshow.currentPage].hospitalId != nil {
            let announcementDetail = AnnouncementDetail.create(announcementId: banners[imgSlideshow.currentPage].id!,
                                                               longTitle: banners[imgSlideshow.currentPage].title ?? "")
            self.navigationController?.pushViewController(announcementDetail, animated: true)
        }
    }
    
    @objc private func tabOurUnitTapped(sender: UITapGestureRecognizer) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc private func tabOnlineServiceTapped(sender: UITapGestureRecognizer) {
        self.tabBarController?.selectedIndex = 2
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constant.NotificationKeys.TABBAR_PRIMARY_CENTER_BUTTON), object: nil, userInfo: nil)
    }
    
    @objc private func tabOurDoctorTapped(sender: UITapGestureRecognizer) {
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc private func tabOurHospitalTapped(sender: UITapGestureRecognizer) {
        let hospitalList = HospitalList.create()
        let hospitalListNav = UINavigationController(rootViewController: hospitalList)
        self.present(hospitalListNav, animated: true, completion: nil)
    }
    
    private func imageSlideShowSetInputs() {
        imageSourcesForBanner.removeAll()
        
        for hospital in banners {
            imageSourcesForBanner.append(KingfisherSource(urlString: hospital.imageUrl ?? "")!)
        }
        
        imgSlideshow.setImageInputs(imageSourcesForBanner)
        imgSlideshow.reloadInputViews()
    }
    
    private func imageSlideShowPageChanged(_ index: Int){
        if !banners.isEmpty && banners.count > index{
            lblTitle.text = banners[index].title
            lblShortDesc.attributedText = banners[index].shortDescription?.convertHtmlToAttributedStringWithCSS(font: lblShortDesc.font, csscolor: "white", lineheight: 4, csstextalign: "left")
            //lblShortDesc.attributedText = banners[index].shortDescription?.convertHtmlToAttributedString
            constraintTitle.constant = CGFloat(lblTitle.calculateMaxLines * 22)
        }
    }
    
    private func getBanners(hospitalId: Int){
        self.bannerActivityIndicator.show()
        HomeViewModel.getAnnouncements(hospitalId: hospitalId, complation: { (announcement) in
            self.banners = announcement
            if !self.banners.isEmpty{
                for _ in 0..<5{
                    self.banners.append(self.banners[0])
                }
            }
            self.bannerActivityIndicator.hide()
            self.imageSlideShowSetInputs()
            self.imageSlideShowPageChanged(self.imgSlideshow.currentPage)
        }) { (errorMessage) in
            self.bannerActivityIndicator.hide()
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}
