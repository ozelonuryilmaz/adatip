//
//  StaffCategory + CollectionViewExtension.swift
//  adatip
//
//  Created by Onur YILMAZ on 25.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

extension StaffCategory: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.doctorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StaffCategoryCollectionViewCell.reuseID, for: indexPath) as! StaffCategoryCollectionViewCell
        
        cell.setDoctorList(doctor: self.doctorArray[indexPath.row])
        
        cell.backgroundColor = UIColor.customColorWhiteLight
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        
        return cell
    }
    
}

extension StaffCategory: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.calculateWidth()
        return CGSize(width: width, height: width * 1.5)
    }
    
    func calculateWidth() -> CGFloat{
        let estimateWidth = CGFloat(self.estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
}
