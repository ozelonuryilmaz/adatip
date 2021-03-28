//
//  Login.swift
//  adatip
//
//  Created by Onur YILMAZ on 28.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import AuthenticationServices
//import IISightSDK

class Login: BaseViewController/*, IISightSDKLoginDelegate*/ {
    
    @IBOutlet weak var bgEmailView: UIView!
    @IBOutlet weak var bgPasswordView: UIView!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnForgotMyPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnApple: UIButton!
    @IBOutlet weak var constraintApple: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar()
        
        let barButtonClose = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapBtnClose(sender:)))
        self.navigationItem.leftBarButtonItem = barButtonClose
        
        bgEmailView.backgroundColor = UIColor.customColorLightGrey
        bgEmailView.clipsToBounds = true
        bgEmailView.layer.cornerRadius = 10
        
        let placeholderEmailTextColor = UIColor.secondaryColor
        let placeholderEmailText = "your_email".localizable()
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholderEmailText, attributes: [NSAttributedString.Key.foregroundColor : placeholderEmailTextColor])
        tfEmail.borderStyle = .none
        tfEmail.textColor = UIColor.primaryColor
        tfEmail.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfEmail.keyboardType = .emailAddress
        
        bgPasswordView.backgroundColor = UIColor.customColorLightGrey
        bgPasswordView.clipsToBounds = true
        bgPasswordView.layer.cornerRadius = 10
        
        let placeholderPasswordTextColor = UIColor.secondaryColor
        let placeholderPasswordText = "your_password".localizable()
        tfPassword.attributedPlaceholder = NSAttributedString(string: placeholderPasswordText, attributes: [NSAttributedString.Key.foregroundColor : placeholderPasswordTextColor])
        tfPassword.borderStyle = .none
        tfPassword.textColor = UIColor.primaryColor
        tfPassword.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfPassword.isSecureTextEntry = true
        
        btnForgotMyPassword.setTitle("forgot_my_password".localizable(), for: .normal)
        btnForgotMyPassword.setTitleColor(UIColor.customColorGrey, for: .normal)
        btnForgotMyPassword.titleLabel?.font = UIFont.customFont(size: 14, customStyle: .Regular)
        btnForgotMyPassword.addTarget(self, action: #selector(tapBtnForgotMyPassword(sender:)), for: .touchUpInside)
        
        btnLogin.setTitle("login".localizable(), for: .normal)
        btnLogin.clipsToBounds = true
        btnLogin.layer.cornerRadius = 10//btnLogin.frame.size.height / 2
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor.secondaryColor.cgColor
        btnLogin.backgroundColor = UIColor.secondaryColor
        btnLogin.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnLogin.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnLogin.addTarget(self, action: #selector(tapBtnLogin(sender:)), for: .touchUpInside)
        
        btnFacebook.setTitle("with_facebook".localizable(), for: .normal)
        btnFacebook.clipsToBounds = true
        btnFacebook.layer.cornerRadius = 10
        btnFacebook.layer.borderWidth = 1
        btnFacebook.layer.borderColor = UIColor.customColorFacebook.cgColor
        btnFacebook.backgroundColor = UIColor.customColorFacebook
        btnFacebook.tintColor = UIColor.customColorWhite
        btnFacebook.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnFacebook.titleLabel?.font = UIFont.customFont(size: 14, customStyle: .Bold)
        btnFacebook.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        btnFacebook.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        btnFacebook.setImage(UIImage(named: "facebook"), for: .normal)
        btnFacebook.contentHorizontalAlignment = .leading
        btnFacebook.addTarget(self, action: #selector(tapBtnFacebook(sender:)), for: .touchUpInside)
        
        GIDSignIn.sharedInstance()?.delegate = self
        btnGoogle.setTitle("with_google".localizable(), for: .normal)
        btnGoogle.clipsToBounds = true
        btnGoogle.layer.cornerRadius = 10
        btnGoogle.layer.borderWidth = 1
        btnGoogle.layer.borderColor = UIColor.customColorGrey.cgColor
        btnGoogle.backgroundColor = UIColor.customColorWhite
        btnGoogle.tintColor = UIColor.customColorDarkGrey
        btnGoogle.setTitleColor(UIColor.customColorDarkGrey, for: .normal)
        btnGoogle.titleLabel?.font = UIFont.customFont(size: 14, customStyle: .Bold)
        btnGoogle.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        btnGoogle.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        btnGoogle.setImage(UIImage(named: "google-login"), for: .normal)
        btnGoogle.contentHorizontalAlignment = .leading
        btnGoogle.addTarget(self, action: #selector(tapBtnGoogle(sender:)), for: .touchUpInside)
        
        btnApple.setTitle("with_apple".localizable(), for: .normal)
        btnApple.clipsToBounds = true
        btnApple.layer.cornerRadius = 10
        btnApple.layer.borderWidth = 1
        btnApple.layer.borderColor = UIColor.customColorBlack.cgColor
        btnApple.backgroundColor = UIColor.customColorBlack
        btnApple.tintColor = UIColor.customColorWhite
        btnApple.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnApple.titleLabel?.font = UIFont.customFont(size: 14, customStyle: .Bold)
        btnApple.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        btnApple.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        btnApple.setImage(UIImage(named: "apple-login"), for: .normal)
        btnApple.contentHorizontalAlignment = .leading
        btnApple.addTarget(self, action: #selector(tapBtnApple(sender:)), for: .touchUpInside)
        
        if #available(iOS 13.0, *) {
            constraintApple.constant = 40
            btnApple.isHidden = false
        }else{
            constraintApple.constant = 0
            btnApple.isHidden = true
        }
        
        lblRegister.text = "dont_you_have_an_account".localizable()
        lblRegister.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblRegister.textColor = UIColor.customColorGrey
        
        lblLogin.text = "or".localizable()
        lblLogin.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblLogin.textColor = UIColor.customColorGrey
        
        btnRegister.setTitle("register".localizable(), for: .normal)
        btnRegister.setTitleColor(UIColor.primaryColor, for: .normal)
        btnRegister.titleLabel?.font = UIFont.customFont(size: 22, customStyle: .Bold)
        btnRegister.addTarget(self, action: #selector(tapBtnRegister(sender:)), for: .touchUpInside)
        
        //IISightSDKManager.shared().loginDelegate = self
        
    }
    
    
    // MARK: *** Button Tap Action
    
    @IBAction func tapBtnLogin(sender: AnyObject){
        let email = tfEmail.text ?? ""
        let password = tfPassword.text ?? ""
        
        self.signIn(email: email, password: password)
    }
    
    @IBAction func tapBtnRegister(sender: AnyObject){
        let register = Register.create()
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    @IBAction func tapBtnForgotMyPassword(sender: AnyObject){
        let forgotMyPassword = ForgotMyPassword.create()
        self.navigationController?.pushViewController(forgotMyPassword, animated: true)
    }

    //MARK: *** Bar Button Action
    
    @IBAction func tapBtnClose(sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func signIn(email: String, password: String){
        self.showProgressView()
        AuthenticationViewModel.signIn(email: email, password: password, complation: { (data) in
            Helper.signIn(email: email,
                          fullName: data.fullName ?? "",
                          accessToken: data.accessToken ?? "",
                          refreshToken: data.accessToken ?? "",
                          role: data.role?.lowercased() ?? "registered")
            
            
            //IISightSDKManager.shared().login_user(withEmail: "ursantr2@gmail.com", password: "123456Onur")
            self.hideProgressView()
            self.dismiss(animated: true, completion: nil)
            
            
            
        }) { (errorMessage) in
            self.hideProgressView()
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
    @IBAction func tapBtnFacebook(sender: UIButton) {
        
        let loginManager = LoginManager()
        
        if let token = AccessToken.current, !token.isExpired {
            loginManager.logOut()
        }
        
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .cancelled:
                print("cancelled")
                break
            case .failed(let error):
                print("error \(error)")
                break
            case .success( _, _, let accessToken):
                //let grantedPermission, let declinedPermissions, let accessToken
                print("token \(accessToken?.userID ?? "")")
                
                let myGraphRequest = GraphRequest(graphPath: "me",
                                                  parameters: ["fields": "id, first_name, last_name, email, picture.width(400)"],
                                                  tokenString: AccessToken.current?.tokenString,
                                                  version: nil,
                                                  httpMethod: .get)
                
                myGraphRequest.start(completionHandler: { (connection, result, error) in
                    
                    let responseDict = result as? [String:Any]
                    
                    let userId = responseDict?["id"] as? String
                    let registerFirstName = responseDict?["first_name"] as? String
                    let registerLastName = responseDict?["last_name"] as? String
                    let registerEmail = responseDict?["email"] as? String
                    
                    if let picture = responseDict?["picture"] as? [String:Any] ,
                       let imgData = picture["data"] as? [String:Any] ,
                       let imgUrl = imgData["url"] as? String {
                        print("imageUrl: \(imgUrl)")
                    }
                    
                    print("userId: \(userId ?? "")")
                    print("registerEmail: \(registerEmail ?? "")")
                    print("registerFirstName: \(registerFirstName ?? "")")
                    print("registerLastName: \(registerLastName ?? "")")
                    
                    self.tfEmail.text = registerEmail
                    self.tfPassword.text = userId
                    
                    //self.loginAuthenticate(userName: registerEmail, password: nil, userId: userId, loginType: "WithFacebook")
                    
                })
                
                break
            }
        }
    }
    
    @IBAction func tapBtnGoogle(sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            GIDSignIn.sharedInstance()?.signOut()
        }
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func tapBtnApple(sender: UIButton) {
        if #available(iOS 13.0, *) {
            let provider = ASAuthorizationAppleIDProvider()
            let request = provider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
            
        }
        
        
    }
    
    /*
    func loginSuccessful() {
        print("Successful login")
        
        hideProgressView()
        dismiss(animated: true, completion: nil)
    }
    
    func loginFailedWithErrorMessage(_ errorMessage: String?) {
        print("Login failed. 11Sight error message: \(errorMessage ?? "")")
        
        Helper.signOut()
        hideProgressView()
        showAlert(title: "login_failed".localizable(), message: errorMessage ?? "")
        //self.dismiss(animated: true, completion: nil)
    }
    */
}

extension Login{
    static let reuseId = "login"
    
    static func create() -> UIViewController{
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let login = mainStoryBoard.instantiateViewController(withIdentifier: reuseId) as! Login
        
        return login
    }
}

extension Login: GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error == nil{
            if let userId = user.userID{
                print(userId)
                print(user.profile.email ?? "")
                print(user.profile.givenName ?? "")
                print(user.profile.familyName ?? "")
                print(user.profile.imageURL(withDimension: 400) ?? "")
                
                self.tfEmail.text = user.profile.email ?? ""
                self.tfPassword.text = userId
                
                //self.loginAuthenticate(userName: registerEmail, password: nil, userId: userId, loginType: "WithGoogle")
            }
        }
        
    }
    
}


@available(iOS 13.0, *)
extension Login: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Failed!")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            
            let userId = credentials.user
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            
            print(firstName ?? "")
            print(lastName ?? "")
            print(email ?? "")
            print(userId)
            
            self.tfEmail.text = email ?? ""
            self.tfPassword.text = userId
            
            //self.loginAuthenticate(userName: email, password: nil, userId: userId, loginType: "WithApple")
            
            break
        default:
            break
        }
    }
    
}

@available(iOS 13.0, *)
extension Login: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
}
