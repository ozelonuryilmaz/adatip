//
//  OurUnitsCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OurUnitsCell: UITableViewCell {
    
    static let reuseID = "ourUnitsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OurUnitsCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var constTitle: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!{
        didSet{
            lblTitle.textAlignment = .left
            lblTitle.font = UIFont.customFont(size: 17, customStyle: .Bold)
            lblTitle.textColor = UIColor.secondaryColor
            lblTitle.numberOfLines = 0
            lblShortDesc.sizeToFit()
        }
    }
    
    @IBOutlet weak var lblShortDesc: UILabel!{
        didSet{
            lblShortDesc.textAlignment = .left
            lblShortDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
            lblShortDesc.textColor = UIColor.customColorBlack
            lblShortDesc.numberOfLines = 0
            lblShortDesc.sizeToFit()
        }
    }
    
    @IBOutlet weak var imgUnit: UIImageView!{
        didSet{
            imgUnit.contentMode = .scaleAspectFill
            imgUnit.clipsToBounds = true
            imgUnit.layer.cornerRadius = imgUnit.frame.size.height / 2
        }
    }
    
    func setOurUnitList(ourUnit: GetUnitCategoryResult){
        self.lblTitle.text = ourUnit.categoryName
        self.lblShortDesc.text = ourUnit.shortDescription
        self.imgUnit.kf.setImage(with: URL(string: ourUnit.imageUrl?.encodedTexts() ?? ""))
        
        self.constTitle.constant = CGFloat(self.lblTitle.calculateMaxLines * 25)
    }
    
    
}
