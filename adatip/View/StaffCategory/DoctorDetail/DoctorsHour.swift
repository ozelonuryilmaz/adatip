//
//  DoctorsHour.swift
//  adatip
//
//  Created by Onur YILMAZ on 26.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class DoctorsHour: UIViewController {
    
    @IBOutlet weak var menuCollection: UICollectionView!
    var dates: [String] = []
    var selectedDateIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dates = Helper.getFirstThirtyDay()
        menuCollection.reloadData()
        
    }
    
    
}


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
        self.menuCollection.reloadData()
    }
    
}
