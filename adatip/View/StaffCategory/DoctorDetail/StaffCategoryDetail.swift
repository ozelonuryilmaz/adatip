//
//  StaffCategoryDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 26.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategoryDetail: BaseViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var doctorsInfoContainerView: UIView!
    @IBOutlet weak var doctorsHourContainerView: UIView!
    
    var titleName = String()
    var doctor: GetDoctorResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userRole = UserDefaults.standard.string(forKey: Constant.UserDefaults.USER_ROLE), userRole == "doctor"{
            segmentedControl.isHidden = true
        }else {
            segmentedControl.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doktorsInfoViewSegue" {
            let doctorsInfo = segue.destination as? DoctorsInfo
            doctorsInfo!.titleName = self.titleName
            doctorsInfo!.doctor = self.doctor
        }else if segue.identifier == "doktorsHourViewSegue" {
            let doctorsHour = segue.destination as? DoctorsHour
            doctorsHour!.doctor = self.doctor
        }
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        segmentedControl.setTitle("doctor_info".localizable(), forSegmentAt: 0)
        segmentedControl.setTitle("doctor_hour".localizable(), forSegmentAt: 1)
        let titleSelectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customColorWhite, NSAttributedString.Key.font: UIFont.customFont(size: 15, customStyle: .Regular)]
        segmentedControl.setTitleTextAttributes(titleSelectedTextAttributes as [NSAttributedString.Key : Any], for: .selected)
        let titleNormalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondaryColor, NSAttributedString.Key.font: UIFont.customFont(size: 15, customStyle: .Regular)]
        segmentedControl.setTitleTextAttributes(titleNormalTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor.secondaryColor
        } else {
            segmentedControl.tintColor = UIColor.secondaryColor
        }
        segmentedControl.addTarget(self, action: #selector(switchViews(sender:)), for: .valueChanged)
        
    }
    
    @objc func switchViews(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            doctorsInfoContainerView.alpha = 1
            doctorsHourContainerView.alpha = 0
        }else {
            doctorsInfoContainerView.alpha = 0
            doctorsHourContainerView.alpha = 1
        }
    }
    
}

extension StaffCategoryDetail{
    static let reuseId = "staffCategoryDetail"
    
    static func create(titleName: String, doctor: GetDoctorResult?) -> UIViewController{
        let staffCategory: UIStoryboard = UIStoryboard(name: "StaffCategory", bundle: .main)
        let staffCategoryDetail = staffCategory.instantiateViewController(withIdentifier: reuseId) as! StaffCategoryDetail
        staffCategoryDetail.titleName = titleName
        staffCategoryDetail.doctor = doctor
        
        return staffCategoryDetail
    }
}
