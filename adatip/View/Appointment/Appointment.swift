//
//  Appointment.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Appointment: BaseViewController {
    
    @IBOutlet weak var viewEAppointment: UIView!
    @IBOutlet weak var viewELab: UIView!
    @IBOutlet weak var viewConsoltDoctor: UIView!
    
    @IBOutlet weak var lblEAppointment: UILabel!
    @IBOutlet weak var lblELab: UILabel!
    @IBOutlet weak var lblConsoltDoctor: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "online_services", subtitle: "(" + self.hospitalTitle + ")")
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "online_services", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        viewEAppointment.clipsToBounds = true
        viewEAppointment.layer.cornerRadius = 25
        viewEAppointment.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewEAppointment.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewEAppointment.layer.shadowOpacity = 1.0
        viewEAppointment.layer.shadowRadius = 10.0
        viewEAppointment.layer.masksToBounds = false
        viewEAppointment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabEAppointmentTapped(sender:))))
        
        lblEAppointment.text = "e_appointment".localizable()
        lblEAppointment.font = UIFont.customFont(size: 20, customStyle: .Bold)
        lblEAppointment.textColor = UIColor.secondaryColor
        
        viewELab.clipsToBounds = true
        viewELab.layer.cornerRadius = 25
        viewELab.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewELab.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewELab.layer.shadowOpacity = 1.0
        viewELab.layer.shadowRadius = 10.0
        viewELab.layer.masksToBounds = false
        viewELab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabELabTapped(sender:))))
        
        lblELab.text = "e_lab".localizable()
        lblELab.font = UIFont.customFont(size: 20, customStyle: .Bold)
        lblELab.textColor = UIColor.secondaryColor
        
        viewConsoltDoctor.clipsToBounds = true
        viewConsoltDoctor.layer.cornerRadius = 25
        viewConsoltDoctor.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewConsoltDoctor.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewConsoltDoctor.layer.shadowOpacity = 1.0
        viewConsoltDoctor.layer.shadowRadius = 10.0
        viewConsoltDoctor.layer.masksToBounds = false
        viewConsoltDoctor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabConsoltDoctorTapped(sender:))))
        
        lblConsoltDoctor.text = "consult_doctor".localizable()
        lblConsoltDoctor.font = UIFont.customFont(size: 20, customStyle: .Bold)
        lblConsoltDoctor.textColor = UIColor.secondaryColor
    }
    
    
    // MARK: *** Tap Gesture Recognizer
    @objc private func tabEAppointmentTapped(sender: UITapGestureRecognizer) {
        
    }
    
    @objc private func tabELabTapped(sender: UITapGestureRecognizer) {
        
    }
    
    @objc private func tabConsoltDoctorTapped(sender: UITapGestureRecognizer) {
        self.tabBarController?.selectedIndex = 3
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constant.NotificationKeys.TABBAR_SECONDARY_CENTER_BUTTON), object: nil, userInfo: nil)
    }
    
}
