//
//  UnitCategory.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitCategory: BaseViewController {
    
    @IBOutlet weak var collectionViewSubCategory: UICollectionView!
    var subCategoryArray: [GetUnitSubCategoryResult] = []
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    var titleName = String()
    var unitCategoryId = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
        
        getUnitSubCategoryList(hospitalId: self.hospitalId, unitCategoryId: self.unitCategoryId)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridViewForCollectionView()
        DispatchQueue.main.async {
            self.collectionViewSubCategory.reloadData()
        }
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        setupGridViewForCollectionView()
    }
    
    private func setupGridViewForCollectionView(){
        let flow = collectionViewSubCategory?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    private func getUnitSubCategoryList(hospitalId: Int, unitCategoryId: Int){
        
        self.showProgressView(self.view)
        UnitCategoryViewModel.getUnitSubCategoryList(hospitalId: hospitalId, unitCategoryId: unitCategoryId, complation: { (subCategories) in
            self.subCategoryArray = subCategories
            self.hideProgressView(self.view)
            self.collectionViewSubCategory.reloadData()
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}

extension UnitCategory{
    static let reuseId = "unitCategory"
    
    static func create(titleName: String, unitCategoryId: Int) -> UIViewController{
        let unitCategoryStoryBoard: UIStoryboard = UIStoryboard(name: "UnitCategory", bundle: .main)
        let unitCategory = unitCategoryStoryBoard.instantiateViewController(withIdentifier: reuseId) as! UnitCategory
        unitCategory.titleName = titleName
        unitCategory.unitCategoryId = unitCategoryId
        
        return unitCategory
    }
}
