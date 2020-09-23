//
//  HomeCollectionViewCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "homeCollectionViewCell"
    
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.clipsToBounds = true
            bgView.layer.cornerRadius = 15
            bgView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            bgView.layer.shadowOffset = CGSize(width: 0, height: 2)
            bgView.layer.shadowOpacity = 0.6
            bgView.layer.shadowRadius = 4.0
            bgView.layer.masksToBounds = false
        }
    }
    
    @IBOutlet weak var imgUnit: UIImageView!
    
    @IBOutlet weak var lblUnit: UILabel!{
        didSet{
            lblUnit.textColor = UIColor.secondaryColor.withAlphaComponent(0.8)
            lblUnit.font = UIFont.customFont(size: 12, customStyle: .Regular)
        }
    }
    
}
