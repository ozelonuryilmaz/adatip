//
//  Settings + TableViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 28.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension Settings: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false {
                return 0
            }else {
                return 3
            }
        case 2:
            return 4
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as? SettingsCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0{
            let switchNotification = UISwitch()
            switchNotification.isOn = self.isNotification
            switchNotification.tag = indexPath.row
            switchNotification.addTarget(self, action: #selector(self.tapSwitchNotification(sender:)), for: .valueChanged)
            cell.accessoryView = switchNotification
        }else {
            cell.accessoryView = nil
            cell.accessoryType = .disclosureIndicator
        }
        
        switch indexPath.section {
        case 0:
            cell.lblContent.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
            cell.lblContent.textColor = UIColor.secondaryColor
            cell.lblContent.text = "allow_notifications".localizable()
            
        case 1:
            cell.lblContent.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
            cell.lblContent.textColor = UIColor.secondaryColor
            
            switch indexPath.row {
            case 0:
                cell.lblContent.text = "my_personel_information".localizable()
            case 1:
                cell.lblContent.text = "update_password".localizable()
            case 2:
                cell.lblContent.text = "update_email_address".localizable()
            default:
                cell.lblContent.text = ""
            }
            
        case 2:
            cell.lblContent.font = UIFont.customFont(size: 14, customStyle: .Regular)
            cell.lblContent.textColor = UIColor.customColorBlack
            
            switch indexPath.row {
            case 0:
                cell.lblContent.text = "evaluate_us".localizable()
            case 1:
                cell.lblContent.text = "feedback".localizable()
            case 2:
                cell.lblContent.text = "contact".localizable()
            case 3:
                if UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false {
                    cell.lblContent.text = "login".localizable()
                }else {
                    cell.lblContent.text = "logout".localizable()
                }
                
            default:
                cell.lblContent.text = ""
            }
        default:
            cell.lblContent.text = ""
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else if section == 1 &&  UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false{
            return 0
        }else {
            return 56
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }else if section == 1 &&  UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false{
            return nil
        }else {
            
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 56))
            headerView.backgroundColor = UIColor.white
            
            let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.size.width - 32, height: 56))
            headerLabel.font = UIFont.customFont(size: 15, customStyle: .SemiBold)
            headerLabel.textColor = UIColor.secondaryColor.withAlphaComponent(0.6)
            headerView.addSubview(headerLabel)
            
            switch section {
            case 0:
                headerLabel.text = ""
            case 1:
                headerLabel.text = "account_details".localizable()
            case 2:
                headerLabel.text = "user_settings".localizable()
            default:
                headerLabel.text = ""
            }
            
            return headerView
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 && UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false{
            return 0
        }
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 && UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false{
            return nil
        }
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath), indexPath.section != 0{
            cell.backgroundColor = .customColorLightGrey
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath), indexPath.section != 0{
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                cell.backgroundColor = .clear
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                self.personalInformation()
                
            case 1:
                self.updatePassword()
                
            case 2:
                self.updateEmailAddress()
                
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                self.evaluateUs()
                
            case 1:
                self.feedBack()
                
            case 2:
                self.contact()
            
            case 3:
                if UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false {
                    self.signIn()
                }else {
                    self.signOut()
                }
                
                
            default:
                break
            }
        default:
            break
        }
    }
    
}
