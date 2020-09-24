//
//  StaffCategory.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategory: BaseViewController {

    @IBOutlet weak var bgSearchDoctorView: UIView!
    @IBOutlet weak var tfSearcDoctor: UITextField!
    
    var doctorArray: [GetDoctorResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
        
        getDoctorList(hospitalId: self.hospitalId)
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "our_employees", subtitle: "(" + self.hospitalTitle + ")")
        
        getDoctorList(hospitalId: self.hospitalId)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "our_employees", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        bgSearchDoctorView.backgroundColor = UIColor.customColorLightGrey
        bgSearchDoctorView.clipsToBounds = true
        bgSearchDoctorView.layer.cornerRadius = 10
        
        let placeholderTextColor = UIColor.secondaryColor
        let placeholder = "search_doctor".localizable()
        tfSearcDoctor.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfSearcDoctor.borderStyle = .none
        tfSearcDoctor.textColor = UIColor.primaryColor
        tfSearcDoctor.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
    }
    
    private func getDoctorList(hospitalId: Int){
        
        self.showProgressView(self.view)
        StaffCategoryViewModel.getDoctorList(hospitalId: hospitalId, complation: { (doctorList) in
            self.doctorArray = doctorList
            self.hideProgressView(self.view)
            //self.collectionViewDoctor.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}
