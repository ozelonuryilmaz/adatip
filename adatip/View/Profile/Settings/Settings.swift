//
//  Settings.swift
//  adatip
//
//  Created by Onur YILMAZ on 27.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Settings: BaseViewController {
    
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


