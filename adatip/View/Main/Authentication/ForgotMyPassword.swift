//
//  ForgotMyPassword.swift
//  adatip
//
//  Created by Onur YILMAZ on 28.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class ForgotMyPassword: BaseViewController {
    
    @IBOutlet weak var lblForgotMyPassword: UILabel!
    @IBOutlet weak var lblForgotMyPasswordDesc: UILabel!
    
    @IBOutlet weak var bgEmailView: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var btnSent: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblLogin: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    

    private func setupViewComponents(){
        self.setupNavigationBar()
        
        lblForgotMyPassword.text = "forgot_my_password".localizable()
        lblForgotMyPassword.font = UIFont.customFont(size: 24, customStyle: .Bold)
        lblForgotMyPassword.textColor = UIColor.secondaryColor
        
        lblForgotMyPasswordDesc.text = "your_password_will_be_sent_to_your_email_address".localizable()
        lblForgotMyPasswordDesc.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblForgotMyPasswordDesc.textColor = UIColor.secondaryColor
        
        bgEmailView.backgroundColor = UIColor.customColorLightGrey
        bgEmailView.clipsToBounds = true
        bgEmailView.layer.cornerRadius = 10
        
        let placeholderTextColor = UIColor.secondaryColor
        let placeholderEmailText = "email_address".localizable()
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholderEmailText, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfEmail.borderStyle = .none
        tfEmail.textColor = UIColor.primaryColor
        tfEmail.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfEmail.keyboardType = .emailAddress
        
        btnSent.setTitle("sent".localizable(), for: .normal)
        btnSent.clipsToBounds = true
        btnSent.layer.cornerRadius = btnLogin.frame.size.height / 2
        btnSent.backgroundColor = UIColor.secondaryColor
        btnSent.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnSent.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnSent.addTarget(self, action: #selector(tapBtnSent(sender:)), for: .touchUpInside)
        
        lblLogin.text = "do_you_already_have_an_account".localizable()
        lblLogin.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblLogin.textColor = UIColor.customColorGrey
        
        btnLogin.setTitle("login".localizable(), for: .normal)
        btnLogin.setTitleColor(UIColor.primaryColor, for: .normal)
        btnLogin.titleLabel?.font = UIFont.customFont(size: 22, customStyle: .Bold)
        btnLogin.addTarget(self, action: #selector(tapBtnLogin(sender:)), for: .touchUpInside)
    }
    
    // MARK: *** Button Tap Action
    
    @IBAction func tapBtnSent(sender: AnyObject){
        
    }
    
    @IBAction func tapBtnLogin(sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }

}

extension ForgotMyPassword{
    static let reuseId = "forgotMyPassword"
    
    static func create() -> UIViewController{
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let forgotMyPassword = mainStoryBoard.instantiateViewController(withIdentifier: reuseId) as! ForgotMyPassword
        
        return forgotMyPassword
    }
}

