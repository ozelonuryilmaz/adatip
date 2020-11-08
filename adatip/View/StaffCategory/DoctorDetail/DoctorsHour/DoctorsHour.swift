//
//  DoctorsHour.swift
//  adatip
//
//  Created by Onur YILMAZ on 26.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class DoctorsHour: BaseViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var hourTableView: UITableView!
    var availabilityTimeList: [GetAvailabilityTimes] = []
    var doctor: GetDoctorResult?
    
    var dates: [String] = []
    var selectedDateIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.bool(forKey: Constant.UserDefaults.HAS_USER_LOGGED_IN) == false {
            menuCollection.isHidden = true
            hourTableView.isHidden = true
            btnLogin.isHidden = false
        }else {
            menuCollection.isHidden = false
            hourTableView.isHidden = false
            btnLogin.isHidden = true
            
            getAvailabilityTimeList(appointmentDate: dates[selectedDateIndex], hospitalId: hospitalId, doctorId: (doctor?.doctorId)!)
        }
        
        
    }
    
    private func setupViewComponents(){
        
        btnLogin.setTitle("login".localizable(), for: .normal)
        btnLogin.clipsToBounds = true
        btnLogin.layer.cornerRadius = btnLogin.frame.size.height / 2
        btnLogin.backgroundColor = UIColor.secondaryColor
        btnLogin.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnLogin.titleLabel?.font = UIFont.customFont(size: 15, customStyle: .Bold)
        btnLogin.addTarget(self, action: #selector(tapBtnLogin(sender:)), for: .touchUpInside)
        
        hourTableView.register(DoctorsHourCell.nib(), forCellReuseIdentifier: DoctorsHourCell.reuseID)
        view.addSubview(hourTableView)
        hourTableView.tableFooterView = UIView()
        hourTableView.separatorStyle = .none
        
        dates = Helper.getFirstThirtyDay()
        menuCollection.reloadData()
    }
    
    // MARK: *** Button Tap Action
    
    @IBAction func tapBtnLogin(sender: AnyObject){
        let login = Login.create()
        let loginNav = UINavigationController(rootViewController: login)
        loginNav.modalPresentationStyle = .fullScreen
        loginNav.modalTransitionStyle = .crossDissolve
        self.present(loginNav, animated: true, completion: nil)
    }
    
    private func getAvailabilityTimeList(appointmentDate: String, hospitalId: Int, doctorId: Int){
        self.showProgressView(self.view)
        
        DoctorViewModel.getAvailabilityTimes(appointmentDate: appointmentDate, hospitalId: hospitalId, doctorId: doctorId, complation: { (availabilityTimeList) in
            self.availabilityTimeList = availabilityTimeList
            
            self.hideProgressView(self.view)
            self.hourTableView.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}



//MARK: *** CollectionView
extension DoctorsHour : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorHourDateCell.reuseID, for: indexPath) as! DoctorHourDateCell
        
        let date = dates[indexPath.item].formatTo(desiredFormat: "dd MMMM")
        cell.setupCell(text: date)
        cell.titleLabel.textColor = self.selectedDateIndex == indexPath.row ? UIColor.primaryColor : UIColor.secondaryColor
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let cell = menuCollection.dequeueReusableCell(withReuseIdentifier: DoctorHourDateCell.reuseID, for: indexPath) as? DoctorHourDateCell{
            let string = dates[indexPath.row]
            let font = cell.titleLabel.font!
            let width = string.size(font: font).width
            
            return CGSize(width: width + 10, height: collectionView.bounds.height)
        }
        
        return CGSize(width: self.view.frame.width / CGFloat(2), height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDateIndex = indexPath.row
        getAvailabilityTimeList(appointmentDate: dates[selectedDateIndex], hospitalId: hospitalId, doctorId: (doctor?.doctorId)!)
        menuCollection.reloadData()
    }
    
}



//MARK: *** TableView
extension DoctorsHour: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.availabilityTimeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DoctorsHourCell.reuseID, for: indexPath) as? DoctorsHourCell else {
            return UITableViewCell()
        }
        
        cell.setDoctorsHour(times: self.availabilityTimeList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.availabilityTimeList[indexPath.row].isAvailable == true {
            let onlinePayment = OnlinePayment.create(hospitalId: hospitalId,
                                                     doctorId: (doctor?.doctorId)!,
                                                     appointmentDate: dates[selectedDateIndex],
                                                     appointmentTime: availabilityTimeList[indexPath.row].timeOfDay ?? "",
                                                     doctorName: doctor?.fullName ?? "",
                                                     doctorsUnit: doctor?.profession ?? "")
            self.navigationController?.pushViewController(onlinePayment, animated: true)
        }
    }
}

