//
//  Register.swift
//  adatip
//
//  Created by Onur YILMAZ on 28.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Register: BaseViewController {
    
    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var lblRegisterDesc: UILabel!
    
    @IBOutlet weak var bgNameAndFirstNameView: UIView!
    @IBOutlet weak var tfNameAndFirstName: UITextField!
    
    @IBOutlet weak var bgPhoneNumberView: UIView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    @IBOutlet weak var bgEmailView: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var bgIdentifierView: UIView!
    @IBOutlet weak var tfIdentifier: UITextField!
    
    @IBOutlet weak var bgBirthView: UIView!
    @IBOutlet weak var tfBirth: UITextField!
    
    @IBOutlet weak var bgFatherView: UIView!
    @IBOutlet weak var tfFather: UITextField!
    
    @IBOutlet weak var bgPasswordView: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblLogin: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    

    private func setupViewComponents(){
        self.setupNavigationBar()
        
        lblRegister.text = "create_account".localizable()
        lblRegister.font = UIFont.customFont(size: 24, customStyle: .Bold)
        lblRegister.textColor = UIColor.secondaryColor
        
        lblRegisterDesc.text = "your_information_will_be_used_to_create_an_appointment".localizable()
        lblRegisterDesc.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblRegisterDesc.textColor = UIColor.secondaryColor
        
        let placeholderTextColor = UIColor.secondaryColor
        
        bgNameAndFirstNameView.backgroundColor = UIColor.customColorLightGrey
        bgNameAndFirstNameView.clipsToBounds = true
        bgNameAndFirstNameView.layer.cornerRadius = 10
        
        let placeholderNameAndFirstNameText = "name_and_firstname".localizable()
        tfNameAndFirstName.attributedPlaceholder = NSAttributedString(string: placeholderNameAndFirstNameText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfNameAndFirstName.borderStyle = .none
        tfNameAndFirstName.textColor = UIColor.primaryColor
        tfNameAndFirstName.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfNameAndFirstName.keyboardType = .default
        
        bgPhoneNumberView.backgroundColor = UIColor.customColorLightGrey
        bgPhoneNumberView.clipsToBounds = true
        bgPhoneNumberView.layer.cornerRadius = 10
        
        let placeholderPhoneNumberText = "phone_number".localizable()
        tfPhoneNumber.attributedPlaceholder = NSAttributedString(string: placeholderPhoneNumberText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfPhoneNumber.borderStyle = .none
        tfPhoneNumber.textColor = UIColor.primaryColor
        tfPhoneNumber.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfPhoneNumber.keyboardType = .numberPad
        
        bgEmailView.backgroundColor = UIColor.customColorLightGrey
        bgEmailView.clipsToBounds = true
        bgEmailView.layer.cornerRadius = 10
        
        let placeholderEmailText = "email_address".localizable()
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholderEmailText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfEmail.borderStyle = .none
        tfEmail.textColor = UIColor.primaryColor
        tfEmail.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfEmail.keyboardType = .emailAddress
        
        bgIdentifierView.backgroundColor = UIColor.customColorLightGrey
        bgIdentifierView.clipsToBounds = true
        bgIdentifierView.layer.cornerRadius = 10
        
        let placeholderIdentifierText = "identifier".localizable()
        tfIdentifier.attributedPlaceholder = NSAttributedString(string: placeholderIdentifierText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfIdentifier.borderStyle = .none
        tfIdentifier.textColor = UIColor.primaryColor
        tfIdentifier.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfIdentifier.keyboardType = .numberPad
        tfIdentifier.keyboardType = .numberPad
        
        bgBirthView.backgroundColor = UIColor.customColorLightGrey
        bgBirthView.clipsToBounds = true
        bgBirthView.layer.cornerRadius = 10
        
        let placeholderBirthText = "year_of_birth".localizable()
        tfBirth.attributedPlaceholder = NSAttributedString(string: placeholderBirthText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfBirth.borderStyle = .none
        tfBirth.textColor = UIColor.primaryColor
        tfBirth.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfBirth.keyboardType = .numberPad
        
        bgFatherView.backgroundColor = UIColor.customColorLightGrey
        bgFatherView.clipsToBounds = true
        bgFatherView.layer.cornerRadius = 10
        
        let placeholderFatherText = "father_name".localizable()
        tfFather.attributedPlaceholder = NSAttributedString(string: placeholderFatherText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfFather.borderStyle = .none
        tfFather.textColor = UIColor.primaryColor
        tfFather.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfFather.keyboardType = .default
        
        bgPasswordView.backgroundColor = UIColor.customColorLightGrey
        bgPasswordView.clipsToBounds = true
        bgPasswordView.layer.cornerRadius = 10
        
        let placeholderPasswordText = "your_password".localizable()
        tfPassword.attributedPlaceholder = NSAttributedString(string: placeholderPasswordText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfPassword.borderStyle = .none
        tfPassword.textColor = UIColor.primaryColor
        tfPassword.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfPassword.isSecureTextEntry = true
        
        btnSave.setTitle("save".localizable(), for: .normal)
        btnSave.clipsToBounds = true
        btnSave.layer.cornerRadius = btnLogin.frame.size.height / 2
        btnSave.backgroundColor = UIColor.secondaryColor
        btnSave.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnSave.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnSave.addTarget(self, action: #selector(tapBtnSave(sender:)), for: .touchUpInside)
        
        lblLogin.text = "do_you_already_have_an_account".localizable()
        lblLogin.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblLogin.textColor = UIColor.customColorGrey
        
        btnLogin.setTitle("login".localizable(), for: .normal)
        btnLogin.setTitleColor(UIColor.primaryColor, for: .normal)
        btnLogin.titleLabel?.font = UIFont.customFont(size: 22, customStyle: .Bold)
        btnLogin.addTarget(self, action: #selector(tapBtnLogin(sender:)), for: .touchUpInside)
        
    }
    
    // MARK: *** Button Tap Action
    
    @IBAction func tapBtnSave(sender: AnyObject){
        
        let fullName = self.tfNameAndFirstName.text ?? ""
        let phoneNumber = self.tfPhoneNumber.text ?? ""
        let email = self.tfEmail.text ?? ""
        let identifier = self.tfIdentifier.text ?? ""
        let yearOfBirth = self.tfBirth.text ?? ""
        let fatherName = self.tfFather.text ?? ""
        let password = self.tfPassword.text ?? ""
        
        register(deviceTokenId: identifier, firstName: fullName, lastName: phoneNumber, email: email, confirmEmail: email, birthYear: yearOfBirth, fatherName: fatherName, password: password, confirmPassword: password)
    }
    
    @IBAction func tapBtnLogin(sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func register(deviceTokenId: String?, firstName: String, lastName: String, email: String, confirmEmail: String, birthYear: String, fatherName: String, password: String, confirmPassword: String){
        
        self.showProgressView()
        AuthenticationViewModel.register(deviceTokenId: deviceTokenId, firstName: firstName, lastName: lastName, email: email, confirmEmail: confirmEmail, birthYear: birthYear, fatherName: fatherName, password: password, confirmPassword: confirmPassword, complation: { (data) in
            
            self.signIn(email: email, password: password)
            
        }) { (errorMessage) in
            self.hideProgressView()
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
    private func signIn(email: String, password: String){
        AuthenticationViewModel.signIn(email: email, password: password, complation: { (data) in
            Helper.signIn(email: email,
                          fullName: data.fullName ?? "",
                          accessToken: data.accessToken ?? "",
                          refreshToken: data.accessToken ?? "",
                          role: data.role?.lowercased() ?? "registered")
            
            self.hideProgressView()
            self.dismiss(animated: true, completion: nil)
            
        }) { (errorMessage) in
            self.hideProgressView()
            self.showAlert(title: nil, message: errorMessage)
        }
    }

}

extension Register{
    static let reuseId = "register"
    
    static func create() -> UIViewController{
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let register = mainStoryBoard.instantiateViewController(withIdentifier: reuseId) as! Register
        
        return register
    }
}
