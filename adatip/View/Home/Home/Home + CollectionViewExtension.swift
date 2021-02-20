//
//  Home + CollectionViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit


extension Home: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ourUnitArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseID, for: indexPath) as! HomeCollectionViewCell
        
        let item = ourUnitArray[indexPath.row]
        
        cell.imgUnit.kf.setImage(with: URL(string: item.imageUrl?.encodedTexts() ?? ""))
        cell.lblUnit.text = item.categoryName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 130)//CGSize(width: self.view.frame.width / 4, height: collectionView.bounds.height)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        selectedIndex = indexPath.item
        selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
        menuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
        refreshTableViewContent()*/
        
        let ourUnit = self.ourUnitArray[indexPath.row]
        
        let unitCategory = UnitCategory.create(titleName: ourUnit.categoryName ?? "",
                                               unitCategoryId: ourUnit.unitCategoryId!)
        self.navigationController?.pushViewController(unitCategory, animated: true)
    }
    
    
}
