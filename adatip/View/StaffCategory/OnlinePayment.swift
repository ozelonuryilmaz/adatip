//
//  OnlinePayment.swift
//  adatip
//
//  Created by Onur YILMAZ on 7.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import BLTNBoard

class OnlinePayment: BaseViewController {
    
    @IBOutlet weak var lblAppointmentInfo: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblAppointmentDate: UILabel!
    @IBOutlet weak var lblDoctorName: UILabel!
    @IBOutlet weak var lblDoctorsUnit: UILabel!
    @IBOutlet weak var lblPayment: UILabel!
    
    @IBOutlet weak var lblCardInfo: UILabel!
    @IBOutlet weak var bgCardName: UIView!
    @IBOutlet weak var bgCardNumber: UIView!
    @IBOutlet weak var bgCardDate: UIView!
    @IBOutlet weak var bgCardCCV: UIView!
    @IBOutlet weak var tfCardName: UITextField!
    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var tfCardDate: UITextField!
    @IBOutlet weak var tfCardCCV: UITextField!
    
    @IBOutlet weak var btnPayment: UIButton!
    
    var __hospitalId = Int()
    var __doctorId = Int()
    var appointmentDate = String()
    var appointmentTime = String()
    var doctorName = String()
    var doctorsUnit = String()
    
    var customerName = ""
    
    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "your_payment_is_received".localizable())
        item.image = UIImage(named: "confirm-payment")
        item.actionButtonTitle = "my_appointments".localizable()
        item.descriptionText = "\(customerName.capitalized)\n\("\(self.appointmentDate.formatTo(desiredFormat: "dd MMMM yyyy")) \(self.appointmentTime)")\n\n\(doctorName)\n\(doctorsUnit)"
        
        item.appearance.actionButtonColor = UIColor.secondaryColor
        item.appearance.titleTextColor = UIColor.customColorGreen
        item.appearance.descriptionTextColor = UIColor.customColorBlack
        
        item.actionHandler = { _ in
            self.didTapBoardMyAppointment()
        }
        
        item.dismissalHandler = { _ in
            self.dismissBulletin()
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "online_payment")
        
        lblAppointmentInfo.text = "your_appointment_info".localizable()
        lblAppointmentInfo.font = UIFont.customFont(size: 24, customStyle: .Bold)
        lblAppointmentInfo.textColor = UIColor.secondaryColor
        
        customerName = UserDefaults.standard.string(forKey: Constant.UserDefaults.FULL_NAME) ?? ""
        lblCustomerName.text = customerName.capitalized
        lblCustomerName.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblCustomerName.textColor = UIColor.secondaryColor
        
        lblAppointmentDate.text = "\(self.appointmentDate.formatTo(desiredFormat: "dd MMMM yyyy")) \(self.appointmentTime)"
        lblAppointmentDate.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblAppointmentDate.textColor = UIColor.secondaryColor
        
        lblDoctorName.text = self.doctorName
        lblDoctorName.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblDoctorName.textColor = UIColor.secondaryColor
        
        lblDoctorsUnit.text = self.doctorsUnit
        lblDoctorsUnit.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblDoctorsUnit.textColor = UIColor.secondaryColor
        
        lblPayment.text = "300 ₺"
        lblPayment.font = UIFont.customFont(size: 20, customStyle: .Bold)
        lblPayment.textColor = UIColor.customColorGreen
        
        lblCardInfo.text = "your_card_info".localizable()
        lblCardInfo.font = UIFont.customFont(size: 24, customStyle: .Bold)
        lblCardInfo.textColor = UIColor.secondaryColor

        let placeholderTextColor = UIColor.secondaryColor
        
        //MARK: *** Card Name
        bgCardName.backgroundColor = UIColor.customColorLightGrey
        bgCardName.clipsToBounds = true
        bgCardName.layer.cornerRadius = 10
        let cardName = "card_name".localizable()
        tfCardName.attributedPlaceholder = NSAttributedString(string: cardName, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfCardName.borderStyle = .none
        tfCardName.textColor = UIColor.primaryColor
        tfCardName.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfCardName.keyboardType = .default
        
        //MARK: *** Card Number
        bgCardNumber.backgroundColor = UIColor.customColorLightGrey
        bgCardNumber.clipsToBounds = true
        bgCardNumber.layer.cornerRadius = 10
        let cardNumber = "card_number".localizable()
        tfCardNumber.attributedPlaceholder = NSAttributedString(string: cardNumber, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfCardNumber.borderStyle = .none
        tfCardNumber.textColor = UIColor.primaryColor
        tfCardNumber.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfCardNumber.keyboardType = .numberPad
        
        //MARK: *** Card Date
        bgCardDate.backgroundColor = UIColor.customColorLightGrey
        bgCardDate.clipsToBounds = true
        bgCardDate.layer.cornerRadius = 10
        let cardDate = "card_date".localizable()
        tfCardDate.attributedPlaceholder = NSAttributedString(string: cardDate, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfCardDate.borderStyle = .none
        tfCardDate.textColor = UIColor.primaryColor
        tfCardDate.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfCardDate.keyboardType = .numberPad
        
        //MARK: *** Card CCV
        bgCardCCV.backgroundColor = UIColor.customColorLightGrey
        bgCardCCV.clipsToBounds = true
        bgCardCCV.layer.cornerRadius = 10
        let cardCCV = "ccv".localizable()
        tfCardCCV.attributedPlaceholder = NSAttributedString(string: cardCCV, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfCardCCV.borderStyle = .none
        tfCardCCV.textColor = UIColor.primaryColor
        tfCardCCV.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfCardCCV.keyboardType = .numberPad
        
        
        btnPayment.setTitle("make_payment".localizable(), for: .normal)
        btnPayment.clipsToBounds = true
        btnPayment.layer.cornerRadius = btnPayment.frame.size.height / 2
        btnPayment.backgroundColor = UIColor.secondaryColor
        btnPayment.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnPayment.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnPayment.addTarget(self, action: #selector(tapBtnPayment(sender:)), for: .touchUpInside)
    }
    
    // MARK: *** Button Tap Action
    @IBAction func tapBtnPayment(sender: AnyObject){
        createAppointment(__hospitalId: self.__hospitalId, __doctorId: self.__doctorId, appointmentDate: self.appointmentDate, appointmentTime: self.appointmentTime)
    }
    
    private func didTapBoardMyAppointment(){
        boardManager.dismissBulletin()
        self.dismissBulletin()
    }
    
    private func dismissBulletin(){
        self.tabBarController?.selectedIndex = 4
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    private func createAppointment(__hospitalId: Int, __doctorId: Int, appointmentDate: String, appointmentTime: String){
        self.showProgressView()
        
        OnlinePaymentViewModel.createAppointment(__hospitalId: __hospitalId,
                                                 __doctorId: __doctorId,
                                                 appointmentDate: appointmentDate,
                                                 appointmentTime: appointmentTime,
                                                 complation: { (availabilityTimeList) in
            
            self.hideProgressView()
            self.boardManager.showBulletin(above: self)
            
        }) { (errorMessage) in
            self.hideProgressView()
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}


extension OnlinePayment{
    static let reuseId = "onlinePayment"
    
    static func create(hospitalId: Int, doctorId: Int, appointmentDate: String, appointmentTime: String, doctorName: String, doctorsUnit: String) -> UIViewController{
        let staffCategory: UIStoryboard = UIStoryboard(name: "StaffCategory", bundle: .main)
        let onlinePayment = staffCategory.instantiateViewController(withIdentifier: reuseId) as! OnlinePayment
        onlinePayment.__hospitalId = hospitalId
        onlinePayment.__doctorId = doctorId
        onlinePayment.appointmentDate = appointmentDate
        onlinePayment.appointmentTime = appointmentTime
        onlinePayment.doctorName = doctorName
        onlinePayment.doctorsUnit = doctorsUnit
        
        return onlinePayment
    }
}

