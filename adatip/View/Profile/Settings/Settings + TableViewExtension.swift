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
                return 3 //0
            }else {
                return 3
            }
        case 2:
            return 3
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as? SettingsCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            let switchNotification = UISwitch()
            switchNotification.isOn = self.isNotification
            switchNotification.tag = indexPath.row
            switchNotification.addTarget(self, action: #selector(self.tapSwitchNotification(sender:)), for: .valueChanged)
            
            cell.accessoryView = switchNotification
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
        }
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        headerView.backgroundColor = UIColor.white
        
        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.size.width - 32, height: 45))
        headerLabel.font = UIFont.customFont(size: 15, customStyle: .SemiBold)
        headerLabel.textColor = UIColor.secondaryColor.withAlphaComponent(0.6)
        headerView.addSubview(headerLabel)
        
        switch section {
        case 0:
            headerLabel.text = ""
        case 1:
            headerLabel.text = "account_details".localizable()
        case 2:
            headerLabel.text = "user_details".localizable()
        default:
            headerLabel.text = ""
        }
        
        
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        footerView.backgroundColor = UIColor.clear
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                print("Kişisel Bilgilerim")
                
            case 1:
                print("Şifre Güncelleme")
                
            case 2:
                print("Eposta Adresi Güncelleme")
                
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                print("Bizi Değerlendirin")
                
            case 1:
                print("Geri Bildirim")
                
            case 2:
                print("İletişim")
                
            default:
                break
            }
        default:
            break
        }
    }
    
}
