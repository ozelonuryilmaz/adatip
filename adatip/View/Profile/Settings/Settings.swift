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

}

extension Settings{
    
    static let reuseId = "settings"
    
    static func create() -> UIViewController{
        let profileStoryBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: .main)
        let settings = profileStoryBoard.instantiateViewController(withIdentifier: reuseId) as! Settings
        
        return settings
    }
}


