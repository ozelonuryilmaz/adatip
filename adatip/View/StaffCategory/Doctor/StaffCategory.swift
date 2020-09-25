//
//  StaffCategory.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategory: BaseViewController {

    @IBOutlet weak var bgSearchDoctorView: UIView!
    @IBOutlet weak var tfSearcDoctor: UITextField!
    
    @IBOutlet weak var collectionViewDoctor: UICollectionView!
    
    var timer: Timer? = nil
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    var doctorArray: [GetDoctorResult] = []
    var realDoctorArray: [GetDoctorResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
        
        getDoctorList(hospitalId: self.hospitalId)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridViewForCollectionView()
        DispatchQueue.main.async {
            self.collectionViewDoctor.reloadData()
        }
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "our_employees", subtitle: "(" + self.hospitalTitle + ")")
        
        getDoctorList(hospitalId: self.hospitalId)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "our_employees", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        bgSearchDoctorView.backgroundColor = UIColor.customColorLightGrey
        bgSearchDoctorView.clipsToBounds = true
        bgSearchDoctorView.layer.cornerRadius = 10
        
        let placeholderTextColor = UIColor.secondaryColor
        let placeholder = "search_doctor".localizable()
        tfSearcDoctor.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor])
        tfSearcDoctor.borderStyle = .none
        tfSearcDoctor.textColor = UIColor.primaryColor
        tfSearcDoctor.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        tfSearcDoctor.addTarget(self, action: #selector(textFieldChange(_:)), for: .editingChanged)
        
        collectionViewDoctor.keyboardDismissMode = .onDrag
        collectionViewDoctor.register(StaffCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StaffCategoryCollectionViewCell.reuseID)
        setupGridViewForCollectionView()
        
    }
    
    private func setupGridViewForCollectionView(){
        let flow = collectionViewDoctor?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    private func getDoctorList(hospitalId: Int){
        
        self.showProgressView(self.view)
        StaffCategoryViewModel.getDoctorList(hospitalId: hospitalId, complation: { (doctorList) in
            self.doctorArray = doctorList
            self.realDoctorArray = doctorList
            self.hideProgressView(self.view)
            self.collectionViewDoctor.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
    @objc func textFieldChange(_ textField: UITextField){
        let searchBarText = textField.text ?? ""
        
        if timer != nil{
            timer?.invalidate()
            timer = nil
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            self.doctorArray.removeAll()
            
            for item in self.realDoctorArray{
                let fullName = item.fullName ?? ""
                
                if !fullName.isEmpty{
                    if (fullName.lowercased().contains(searchBarText.lowercased())){
                        self.doctorArray.append(item)
                    }
                }
            }
            
            if searchBarText.isEmpty {
                self.doctorArray = self.realDoctorArray
            }
            
            self.collectionViewDoctor.reloadData()
        })
    }
    
}
