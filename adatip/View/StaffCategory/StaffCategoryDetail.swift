//
//  StaffCategoryDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 26.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class StaffCategoryDetail: BaseViewController {
    
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblProfession: UILabel!
    
    @IBOutlet weak var lblProfessions: UILabel!
    @IBOutlet weak var lblProfessionsDesc: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var lblLanguagesDesc: UILabel!
    
    @IBOutlet weak var lblYearOfBirth: UILabel!
    @IBOutlet weak var lblYearOfBirthDesc: UILabel!
    @IBOutlet weak var lblEducation: UILabel!
    @IBOutlet weak var lblEducationDesc: UILabel!
    
    @IBOutlet weak var lblCourses: UILabel!
    @IBOutlet weak var lblCoursesDesc: UILabel!
    
    @IBOutlet weak var lblResume: UILabel!
    @IBOutlet weak var lblResumeDesc: UILabel!
    
    var titleName = String()
    var doctor: GetDoctorResult?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()

        imgDoctor.contentMode = .scaleAspectFit
        imgDoctor.clipsToBounds = true
        imgDoctor.layer.cornerRadius = 25
        
        lblFullName.font = UIFont.customFont(size: 25, customStyle: .Bold)
        lblFullName.textColor = UIColor.primaryColor
        lblFullName.numberOfLines = 0
        lblFullName.sizeToFit()
        
        lblProfession.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblProfession.textColor = UIColor.customColorBlack
        lblProfession.numberOfLines = 0
        lblProfession.sizeToFit()
        
        lblProfessions.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblProfessions.textColor = UIColor.primaryColor
        lblProfessions.numberOfLines = 1
        
        lblProfessionsDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblProfessionsDesc.textColor = UIColor.customColorBlack
        lblProfessionsDesc.numberOfLines = 0
        lblProfessionsDesc.sizeToFit()
        
        lblLanguages.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblLanguages.textColor = UIColor.primaryColor
        lblLanguages.numberOfLines = 1
        
        lblLanguagesDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblLanguagesDesc.textColor = UIColor.customColorBlack
        lblLanguagesDesc.numberOfLines = 0
        lblLanguagesDesc.sizeToFit()
        
        lblYearOfBirth.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblYearOfBirth.textColor = UIColor.primaryColor
        lblYearOfBirth.numberOfLines = 1
        
        lblYearOfBirthDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblYearOfBirthDesc.textColor = UIColor.customColorBlack
        lblYearOfBirthDesc.numberOfLines = 0
        lblYearOfBirthDesc.sizeToFit()
        
        lblEducation.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblEducation.textColor = UIColor.primaryColor
        lblEducation.numberOfLines = 1
        
        lblEducationDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblEducationDesc.textColor = UIColor.customColorBlack
        lblEducationDesc.numberOfLines = 0
        lblEducationDesc.sizeToFit()
        
        lblCourses.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblCourses.textColor = UIColor.primaryColor
        lblCourses.numberOfLines = 1
        
        lblCoursesDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblCoursesDesc.textColor = UIColor.customColorBlack
        lblCoursesDesc.numberOfLines = 0
        lblCoursesDesc.sizeToFit()
        
        lblResume.font = UIFont.customFont(size: 18, customStyle: .Regular)
        lblResume.textColor = UIColor.primaryColor
        lblResume.numberOfLines = 1
        
        lblResumeDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblResumeDesc.textColor = UIColor.customColorBlack
        lblResumeDesc.numberOfLines = 0
        lblResumeDesc.sizeToFit()
        
        imgDoctor.kf.setImage(with: URL(string: doctor?.imageUrl?.encodedTexts() ?? ""))
        lblFullName.text = doctor?.fullName ?? ""
        lblProfession.text = doctor?.profession ?? ""
        
        lblProfessions.text = "professions".localizable()
        lblProfessionsDesc.attributedText = doctor?.profession?.convertHtmlToAttributedStringWithCSS(font: self.lblProfession.font, csscolor: "black", lineheight: 5, csstextalign: "left")
        
        lblLanguages.text = "language".localizable()
        lblLanguagesDesc.attributedText = doctor?.detail?.languages?.convertHtmlToAttributedStringWithCSS(font: self.lblProfession.font, csscolor: "black", lineheight: 5, csstextalign: "left")
        
        lblYearOfBirth.text = "date_of_birth".localizable()
        if let yearOfBirth = doctor?.detail?.yearOfBirth{
            lblYearOfBirthDesc.text = "\(yearOfBirth)"
        }else{
            lblYearOfBirthDesc.text = ""
        }
            
        lblEducation.text = "education".localizable()
        lblEducationDesc.attributedText = doctor?.detail?.education?.convertHtmlToAttributedStringWithCSS(font: self.lblProfession.font, csscolor: "black", lineheight: 5, csstextalign: "left")
        
        lblCourses.text = "areas_of_expertise".localizable()
        lblCoursesDesc.attributedText = doctor?.detail?.courses?.convertHtmlToAttributedStringWithCSS(font: self.lblProfession.font, csscolor: "black", lineheight: 5, csstextalign: "left")
        
        lblResume.text = "experience".localizable()
        lblResumeDesc.attributedText = doctor?.detail?.resume?.convertHtmlToAttributedStringWithCSS(font: self.lblProfession.font, csscolor: "black", lineheight: 5, csstextalign: "left")
    }
    
}

extension StaffCategoryDetail{
    static let reuseId = "staffCategoryDetail"
    
    static func create(titleName: String, doctor: GetDoctorResult?) -> UIViewController{
        let staffCategory: UIStoryboard = UIStoryboard(name: "StaffCategory", bundle: .main)
        let staffCategoryDetail = staffCategory.instantiateViewController(withIdentifier: reuseId) as! StaffCategoryDetail
        staffCategoryDetail.titleName = titleName
        staffCategoryDetail.doctor = doctor
        
        return staffCategoryDetail
    }
}
