//
//  ProfileCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 8.11.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    static let reuseID = "profileCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.clipsToBounds = true
            bgView.layer.cornerRadius = 25
            bgView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            bgView.layer.shadowOffset = CGSize(width: 0, height: 1)
            bgView.layer.shadowOpacity = 0.4
            bgView.layer.shadowRadius = 5.0
            bgView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var lblCustomerName: UILabel!{
        didSet{
            lblCustomerName.font = UIFont.customFont(size: 14, customStyle: .Regular)
            lblCustomerName.textColor = UIColor.customColorGrey
        }
    }
    @IBOutlet weak var lblDate: UILabel!{
        didSet{
            lblDate.font = UIFont.customFont(size: 14, customStyle: .SemiBold)
        }
    }
    @IBOutlet weak var lblDoctorName: UILabel!{
        didSet{
            lblDoctorName.font = UIFont.customFont(size: 14, customStyle: .Bold)
        }
    }
    @IBOutlet weak var lblDoctorsUnit: UILabel!{
        didSet{
            lblDoctorsUnit.font = UIFont.customFont(size: 14, customStyle: .Regular)
        }
    }
    @IBOutlet weak var lblAppointment: UILabel!{
        didSet{
            lblAppointment.font = UIFont.customFont(size: 14, customStyle: .Regular)
        }
    }
    @IBOutlet weak var lblAppointmentStatus: UILabel!{
        didSet{
            lblAppointmentStatus.font = UIFont.customFont(size: 14, customStyle: .Regular)
            lblAppointmentStatus.textColor = UIColor.secondaryColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setAppointment(appointment: GetAppointmentResult){
        lblCustomerName.text = appointment.customer
        lblDate.text = "\(appointment.appointmentDate?.formatTo(formatValue: "dd.MM.yyyy", desiredFormat: "dd MMMM yyyy") ?? "") \(appointment.appointmentTime ?? "")"
        lblDoctorName.text = appointment.doctor
        lblDoctorsUnit.text = appointment.unit
        lblAppointment.text = "Randevu"
        
        if Date() > appointment.appointmentDate?.convertStringToDate() ?? Date(){
            lblAppointmentStatus.text = "Geçmiş Randevu"
            lblAppointment.textColor = UIColor.customColorGrey
            lblDoctorsUnit.textColor = UIColor.customColorGrey
            lblDoctorName.textColor = UIColor.customColorGrey
            lblDate.textColor = UIColor.customColorGrey
        }else {
            lblAppointmentStatus.text = "Bekliyor"
            lblAppointment.textColor = UIColor.primaryColor
            lblDoctorsUnit.textColor = UIColor.secondaryColor
            lblDoctorName.textColor = UIColor.secondaryColor
            lblDate.textColor = UIColor.primaryColor
        }
        
    }
}
