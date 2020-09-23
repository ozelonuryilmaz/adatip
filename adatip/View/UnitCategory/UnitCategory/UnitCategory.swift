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
    let padding: CGFloat = 20
    
    var titleName = String()
    var unitCategoryId = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
        
        getUnitSubCategoryList(hospitalId: self.hospitalId, unitCategoryId: self.unitCategoryId)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        if let layout = collectionViewSubCategory.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
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
