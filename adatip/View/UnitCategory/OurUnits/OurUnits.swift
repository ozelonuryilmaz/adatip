//
//  OurUnits.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OurUnits: BaseViewController {
    
    @IBOutlet weak var tableViewOurUnits: UITableView!
    var ourUnitArray: [GetUnitCategoryResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
        
        getUnitCategoryList(hospitalId: self.hospitalId)
        
        //when the hospital changed.
        NotificationCenter.default.addObserver(self, selector: #selector(changeHospital), name: NSNotification.Name(rawValue: Constant.NotificationKeys.CHANGE_HOSPITAL), object: nil)
    }
    
    @objc private func changeHospital() {
        updateNavigationBarTitle(title: "our_units", subtitle: "(" + self.hospitalTitle + ")")
        getUnitCategoryList(hospitalId: self.hospitalId)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "our_units", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        tableViewOurUnits.register(OurUnitsCell.nib(), forCellReuseIdentifier: OurUnitsCell.reuseID)
        view.addSubview(tableViewOurUnits)
        
        tableViewOurUnits.rowHeight = UITableView.automaticDimension
        tableViewOurUnits.estimatedRowHeight = 300
        tableViewOurUnits.tableFooterView = UIView()
        
    }
    
    private func getUnitCategoryList(hospitalId: Int){
        
        self.showProgressView(self.view)
        OurUnitsViewModel.getUnitCategoryList(hospitalId: hospitalId, complation: { (ourUnitList) in
            self.ourUnitArray = ourUnitList
            self.hideProgressView(self.view)
            self.tableViewOurUnits.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}
