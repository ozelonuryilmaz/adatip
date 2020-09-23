//
//  HospitalList + TableViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension HospitalList: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hospitalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HospitalListCell.reuseID, for: indexPath) as? HospitalListCell else {
            return UITableViewCell()
        }
        cell.setHospitalList(hospital: self.hospitalArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let hospital = self.hospitalArray[indexPath.row]
        UserDefaults.standard.set(hospital.hospitalId, forKey: Constant.UserDefaults.HOSPITAL_ID)
        UserDefaults.standard.set(hospital.title, forKey: Constant.UserDefaults.HOSPITALL_TITLE)
        
        if !self.firstTime {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL_INFO), object: nil, userInfo: nil)
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil, userInfo: nil)
        }else{
            let mainView: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = mainView.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
            mainTabBarController.modalPresentationStyle = .fullScreen
            mainTabBarController.modalTransitionStyle = .crossDissolve
            self.present(mainTabBarController, animated: true, completion: nil)
            
            Helper.setupTabBarControler(tabBarController: mainTabBarController)
        }
        
    }
    
}
