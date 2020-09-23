//
//  HospitalList.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class HospitalList: BaseViewController {
    
    @IBOutlet weak var tableViewHospital: UITableView!
    var hospitalArray: [GetHospitalResult] = []
    var firstTime: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar(titleName: "our_hospitals")
        
        if !firstTime {
            let barButtonClose = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapBtnClose(sender:)))
            self.navigationItem.leftBarButtonItem = barButtonClose
        }
        
        tableViewHospital.register(HospitalListCell.nib(), forCellReuseIdentifier: HospitalListCell.reuseID)
        view.addSubview(tableViewHospital)
        
        tableViewHospital.contentInset = UIEdgeInsets(top: 12.5, left: 0, bottom: 12.5, right: 0)
        tableViewHospital.separatorStyle = .none
        tableViewHospital.rowHeight = UITableView.automaticDimension
        tableViewHospital.estimatedRowHeight = 300
        tableViewHospital.tableFooterView = UIView()
        
        getHospitalList()
        
    }
    
    //MARK: *** Bar Button Action
    @IBAction func tapBtnClose(sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func getHospitalList(){
        
        self.showProgressView(self.view)
        HospitalListViewModel.getHospitalList(complation: { (hospitalList) in
            self.hospitalArray = hospitalList
            self.hideProgressView(self.view)
            self.tableViewHospital.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}

extension HospitalList{
    static let reuseId = "hospitalList"
    
    static func create(firstTime: Bool = false) -> UIViewController{
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let hospitalList = mainStoryBoard.instantiateViewController(withIdentifier: reuseId) as! HospitalList
        hospitalList.firstTime = firstTime
        return hospitalList
    }
}
