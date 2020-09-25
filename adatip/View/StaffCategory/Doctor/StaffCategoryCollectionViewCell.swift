//
//  StaffCategoryCollectionViewCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 25.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "staffCategoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StaffCategoryCollectionViewCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.backgroundColor = UIColor.customColorWhite.withAlphaComponent(0.8)
            bgView.layer.cornerRadius = 25
            bgView.clipsToBounds = true
        }
    }
    @IBOutlet weak var lblDoctorName: UILabel!{
        didSet{
            lblDoctorName.font = UIFont.customFont(size: 16, customStyle: .SemiBold)
            lblDoctorName.textColor = UIColor.secondaryColor
            lblDoctorName.numberOfLines = 2
        }
    }
    @IBOutlet weak var lblDoctorUnit: UILabel!{
        didSet{
            lblDoctorUnit.font = UIFont.customFont(size: 14, customStyle: .Regular)
            lblDoctorUnit.textColor = UIColor.secondaryColor
            lblDoctorUnit.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var imgDoctor: UIImageView!{
        didSet{
            imgDoctor.contentMode = .scaleAspectFill
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDoctorList(doctor: GetDoctorResult){
        self.lblDoctorName.text = doctor.fullName
        self.lblDoctorUnit.text = doctor.profession
        
        self.imgDoctor.kf.setImage(with: URL(string: doctor.imageUrl?.encodedTexts() ?? ""))
    }

}
