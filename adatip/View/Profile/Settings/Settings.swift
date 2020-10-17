//
//  Settings.swift
//  adatip
//
//  Created by Onur YILMAZ on 27.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import IISightSDK

class Settings: BaseViewController, IISightSDKLogoutDelegate {
    
    @IBOutlet weak var tableViewSettings: UITableView!
    var isNotification: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "settings")
        
        tableViewSettings.register(SettingsCell.nib(), forCellReuseIdentifier: SettingsCell.reuseID)
        view.addSubview(tableViewSettings)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewSettings.reloadData()
    }
    
    //MARK: *** Switch Action
    
    @IBAction func tapSwitchNotification(sender: UISwitch){
        self.isNotification = sender.isOn
        
        if sender.isOn {
            print(self.isNotification)
            
        }else{
            print(self.isNotification)
            
        }
    }
    
    //MARK: *** didSelectRowAt Actions
    
    func updatePassword(){
        print("updatePassword")
    }
    
    func updateEmailAddress(){
        print("updateEmailAddress")
    }
    
    func personalInformation(){
        print("personalInformation")
    }
    
    func signIn(){
        let login = Login.create()
        let loginNav = UINavigationController(rootViewController: login)
        loginNav.modalPresentationStyle = .fullScreen
        loginNav.modalTransitionStyle = .crossDissolve
        self.present(loginNav, animated: true, completion: nil)
    }
    
    func signOut(){
        Helper.signOut()
        
        logout()
        
        tableViewSettings.reloadData()
    }
    
    func evaluateUs(){
        print("evaluateUs")
    }
    
    func feedBack(){
        print("feedBack")
    }
    
    func contact(){
        print("contact")
        
        makeCall()
    }
    
    func logout() {
        IISightSDKManager.shared().logoutDelegate = self
        IISightSDKManager.shared().logout_user()
    }

    func logoutSuccessful() {
        self.showAlert(title: "11Sight", message: "ursantr2@gmail.com Başarılı ÇIKIŞ")
    }

    func logoutFailedWithErrorMessage(_ errorMessage: String?) {
        self.showAlert(title: "11Sight", message: "ursantr2@gmail.com BAŞARISIZ ÇIKIŞ")
    }
    
    func makeCall() {
        /*
            *   Available callTypes = [.Video, .Audio, Chat]
            */
        //let berkan = "o2J8ZfVbSehjtiNvP07W6C2gKfD62tYI06vtktH4agSsixc3pQ"
        let ursan = "ESAGCC0IHXDqxAm28wv3bHfMddvbyUnQnNkv0oA5q48NpUOoKa"
        IISightSDKManager.shared().startOutgoingCall(ursan, trackerId: nil, callType: IISightCallType.Video)
    }

}

extension Settings{
    
    static let reuseId = "settings"
    
    static func create() -> UIViewController{
        let profileStoryBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: .main)
        let settings = profileStoryBoard.instantiateViewController(withIdentifier: reuseId) as! Settings
        
        return settings
    }
}


