//
//  Profile.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class Profile: BaseViewController {
    
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewMyProfileIcon: UIView!
    
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var appoitmentTableView: UITableView!
    
    var appointmentList: [GetAppointmentResult] = []
    var myPastAppointments: [GetAppointmentResult] = []
    var myAppointments: [GetAppointmentResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fullName = UserDefaults.standard.string(forKey: Constant.UserDefaults.FULL_NAME) ?? ""
        let email = UserDefaults.standard.string(forKey: Constant.UserDefaults.EMAIL) ?? ""
        
        self.lblFullName.text = fullName
        self.lblPhoneNumber.text = email
        
        if UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false {
            appoitmentTableView.isHidden = true
            segmentedControl.isHidden = true
            btnLogin.isHidden = false
        }else {
            appoitmentTableView.isHidden = false
            segmentedControl.isHidden = false
            btnLogin.isHidden = true
            
            getAppointmentList(hospitalId: self.hospitalId)
        }
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "my_profile")
        
        let btnSettings = UIButton(type: .custom)
        btnSettings.setImage(UIImage(named: "gear"), for: .normal)
        btnSettings.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnSettings.addTarget(self, action: #selector(tapBtnSettings(sender:)), for: .touchUpInside)
        let settingsBarButtonItem = UIBarButtonItem(customView: btnSettings)
        self.navigationItem.rightBarButtonItem = settingsBarButtonItem
        
        viewProfile.layerGradient()
        
        viewMyProfileIcon.clipsToBounds = true
        viewMyProfileIcon.layer.cornerRadius = viewMyProfileIcon.frame.size.height / 2
        viewMyProfileIcon.backgroundColor = UIColor.secondaryColor
        
        lblFullName.font = UIFont.customFont(size: 16, customStyle: .Bold)
        lblFullName.textColor = UIColor.secondaryColor
        lblFullName.numberOfLines = 1
        
        lblPhoneNumber.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblPhoneNumber.textColor = UIColor.secondaryColor
        lblPhoneNumber.numberOfLines = 1
        
        segmentedControl.setTitle("my_appointments".localizable(), forSegmentAt: 0)
        segmentedControl.setTitle("my_past_appointments".localizable(), forSegmentAt: 1)
        let titleSelectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customColorWhite, NSAttributedString.Key.font: UIFont.customFont(size: 15, customStyle: .Regular)]
        segmentedControl.setTitleTextAttributes(titleSelectedTextAttributes as [NSAttributedString.Key : Any], for: .selected)
        let titleNormalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondaryColor, NSAttributedString.Key.font: UIFont.customFont(size: 15, customStyle: .Regular)]
        segmentedControl.setTitleTextAttributes(titleNormalTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor.secondaryColor
        } else {
            segmentedControl.tintColor = UIColor.secondaryColor
        }
        segmentedControl.addTarget(self, action: #selector(switchViews(sender:)), for: .valueChanged)
        
        btnLogin.setTitle("login".localizable(), for: .normal)
        btnLogin.clipsToBounds = true
        btnLogin.layer.cornerRadius = btnLogin.frame.size.height / 2
        btnLogin.backgroundColor = UIColor.secondaryColor
        btnLogin.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnLogin.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnLogin.addTarget(self, action: #selector(tapBtnLogin(sender:)), for: .touchUpInside)
        
        appoitmentTableView.register(ProfileCell.nib(), forCellReuseIdentifier: ProfileCell.reuseID)
        view.addSubview(appoitmentTableView)
        appoitmentTableView.tableFooterView = UIView()
        appoitmentTableView.separatorStyle = .none
        
        appoitmentTableView.reloadData()
        
    }
    
    //MARK: *** Bar Button Action
    @IBAction func tapBtnSettings(sender: UIButton){
        self.navigationController?.pushViewController(Settings.create(), animated: true)
    }
    
    // MARK: *** Button Tap Action
    @IBAction func tapBtnLogin(sender: AnyObject){
        let login = Login.create()
        let loginNav = UINavigationController(rootViewController: login)
        loginNav.modalPresentationStyle = .fullScreen
        loginNav.modalTransitionStyle = .crossDissolve
        self.present(loginNav, animated: true, completion: nil)
    }
    
    @objc func switchViews(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            self.appointmentList = self.myAppointments
            self.appoitmentTableView.reloadData()
            self.appoitmentTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }else {
            self.appointmentList = self.myPastAppointments
            self.appoitmentTableView.reloadData()
            self.appoitmentTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
    private func getAppointmentList(hospitalId: Int){
        self.showProgressView(self.view)
        
        ProfileViewModel.getAppointmentList(hospitalId: hospitalId, complation: { (appointment) in
            self.myAppointments.removeAll()
            self.myPastAppointments.removeAll()
            
            for item in appointment {
                if Date() > item.appointmentDate?.convertStringToDate() ?? Date(){
                    self.myPastAppointments.append(item)
                }else {
                    self.myAppointments.append(item)
                }
            }
            
            if self.segmentedControl.selectedSegmentIndex == 0{
                self.appointmentList = self.myAppointments
            }else{
                self.appointmentList = self.myPastAppointments
            }
            
            self.hideProgressView(self.view)
            self.appoitmentTableView.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}


//MARK: *** TableView
extension Profile: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appointmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.reuseID, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        
        cell.setAppointment(appointment: self.appointmentList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
