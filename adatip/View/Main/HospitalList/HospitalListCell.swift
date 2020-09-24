//
//  HospitalListCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 20.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import Kingfisher

class HospitalListCell: UITableViewCell {
    
    static let reuseID = "hospitalListCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HospitalListCell",
                     bundle: nil)
    }

    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.layer.cornerRadius = 20
            bgView.backgroundColor = UIColor.customColorLightGrey
            bgView.clipsToBounds = true
        }
    }
    @IBOutlet weak var lblTitle: UILabel!{
        didSet{
            lblTitle.textAlignment = .left
            lblTitle.font = UIFont.customFont(size: 15, customStyle: .Bold)
            lblTitle.textColor = UIColor.secondaryColor
            lblTitle.numberOfLines = 2
        }
    }
    @IBOutlet weak var imgHospital: UIImageView!{
        didSet{
            imgHospital.contentMode = .scaleAspectFill
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func setHospitalList(hospital: GetHospitalResult){
        self.lblTitle.text = hospital.title
        self.imgHospital.kf.setImage(with: URL(string: hospital.imageUrl?.encodedTexts() ?? ""))//, placeholder: UIImage(named: "empty-res"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
