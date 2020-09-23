//
//  UnitCategoryCollectionViewCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "unitCategoryCollectionViewCell"
    
    @IBOutlet weak var constWidthTitle: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!{
        didSet{
            lblTitle.textAlignment = .center
            lblTitle.font = UIFont.customFont(size: 17, customStyle: .Bold)
            lblTitle.textColor = UIColor.secondaryColor
            lblTitle.numberOfLines = 3
        }
    }
    
    @IBOutlet weak var imgUnit: UIImageView!{
        didSet{
            imgUnit.contentMode = .scaleAspectFill
            imgUnit.clipsToBounds = true
            imgUnit.layer.cornerRadius = imgUnit.frame.size.height / 2
        }
    }
    
    func setSubCategoryList(subCategory: GetUnitSubCategoryResult, lblWidth: CGFloat){
        self.lblTitle.text = subCategory.subCategoryName
        self.imgUnit.kf.setImage(with: URL(string: subCategory.imageUrl ?? ""))
        
        self.constWidthTitle.constant = lblWidth
    }
}
