//
//  DoctorsHourCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 5.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class DoctorsHourCell: UITableViewCell {
    
    static let reuseID = "doctorsHourCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DoctorsHourCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var imgAdd: UIImageView!

    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.clipsToBounds = true
            bgView.layer.cornerRadius = bgView.frame.size.height / 2
            bgView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            bgView.layer.shadowOffset = CGSize(width: 0, height: 2)
            bgView.layer.shadowOpacity = 0.5
            bgView.layer.shadowRadius = 3.0
            bgView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var lblHour: UILabel!{
        didSet{
            lblHour.font = UIFont.customFont(size: 20, customStyle: .SemiBold)
            lblHour.textColor = UIColor.secondaryColor
        }
    }
    @IBOutlet weak var lblAppointment: UILabel!{
        didSet{
            lblAppointment.font = UIFont.customFont(size: 12, customStyle: .Regular)
            lblAppointment.textColor = UIColor.primaryColor
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDoctorsHour(times: GetAvailabilityTimes){
        self.lblHour.text = times.timeOfDay
        
        if times.isAvailable == true {
            lblAppointment.text = "make_an_appointment".localizable()
            lblAppointment.textColor = UIColor.primaryColor
            lblHour.textColor = UIColor.secondaryColor
            imgAdd.isHidden = false
        }else {
            lblAppointment.text = "full".localizable()
            lblAppointment.textColor = UIColor.customColorGrey
            lblHour.textColor = UIColor.customColorGrey
            imgAdd.isHidden = true
        }
        
    }
    
}
