//
//  DoctorHourDateCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 2.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class DoctorHourDateCell: UICollectionViewCell {
    
    static let reuseID = "doctorHourDateCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DoctorHourDateCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont.customFont(size: 14, customStyle: .Bold)
            titleLabel.textColor = UIColor.secondaryColor
            titleLabel.numberOfLines = 0
            titleLabel.sizeToFit()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.alpha = 1.0
    }
    
    func setupCell(text: String) {
        titleLabel.text = text
    }
    /*
    override var isSelected: Bool {
        didSet{
            if isSelected{
                titleLabel.textColor = UIColor.primaryColor
            }else {
                titleLabel.textColor = UIColor.secondaryColor
            }
        }
    }*/
    
}
