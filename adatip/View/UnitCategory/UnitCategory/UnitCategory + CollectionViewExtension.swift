//
//  UnitCategory + CollectionViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit


extension UnitCategory: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.subCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnitCategoryCollectionViewCell.reuseID, for: indexPath) as! UnitCategoryCollectionViewCell
        
        cell.setSubCategoryList(subCategory: self.subCategoryArray[indexPath.row],
                                lblWidth: CGFloat(collectionView.frame.size.width / 2 - self.padding - 16)) // 8+8 label constraint
        
        cell.backgroundColor = UIColor.customColorWhiteLight
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let subCategory = self.subCategoryArray[indexPath.row]
        let unitCategoryDetail = UnitCategoryDetail.create(titleName: self.titleName,
                                                           imageUrl: subCategory.imageUrl ?? "",
                                                           subCategoryName: subCategory.subCategoryName ?? "",
                                                           unitDescription: subCategory.unitDescription ?? "")
        self.navigationController?.pushViewController(unitCategoryDetail, animated: true)
        
    }
    
}


extension UnitCategory: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width / 2 + self.padding
        return CGSize(width: collectionViewSize, height: 208)
    }
    /*
    let estimateWidth: CGFloat = 160.0
    let cellMarginSize: CGFloat = 16.0
     
    func calculateWidth() -> CGFloat{
        let cellCount = floor(CGFloat(self.view.frame.size.width / self.estimateWidth))
        
        let margin = CGFloat(self.cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(self.cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let inset: CGFloat = self.padding / 2
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
