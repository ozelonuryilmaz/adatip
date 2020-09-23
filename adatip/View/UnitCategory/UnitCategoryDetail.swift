//
//  UnitCategoryDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 23.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class UnitCategoryDetail: BaseViewController {
    
    @IBOutlet weak var imgUnitCategory: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var constTitle: NSLayoutConstraint!
    
    @IBOutlet weak var viewDoctor: UIView!
    @IBOutlet weak var btnDoctor: UIButton!
    @IBOutlet weak var viewAppointment: UIView!
    @IBOutlet weak var btnAppointment: UIButton!
    
    var titleName = String()
    var imageUrl = String()
    var subCategoryName = String()
    var unitDescription = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewComponents()
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: titleName, subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        imgUnitCategory.contentMode = .scaleAspectFill
        imgUnitCategory.clipsToBounds = true
        imgUnitCategory.layer.cornerRadius = 25
        
        lblTitle.font = UIFont.customFont(size: 25, customStyle: .Bold)
        lblTitle.textColor = UIColor.primaryColor
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        
        lblDesc.font = UIFont.customFont(size: 15, customStyle: .Regular)
        lblDesc.textColor = UIColor.customColorBlack
        lblDesc.numberOfLines = 0
        lblDesc.sizeToFit()
        
        viewDoctor.backgroundColor = UIColor.primaryColor
        viewDoctor.clipsToBounds = true
        viewDoctor.layer.cornerRadius = viewDoctor.frame.size.height / 2
        viewDoctor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBtnConsultDoctor(sender:))))
        
        btnDoctor.setTitle("consult_doctor".localizable(), for: .normal)
        btnDoctor.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnDoctor.titleLabel?.font = UIFont.customFont(size: 12, customStyle: .Bold)
        btnDoctor.addTarget(self, action: #selector(tapBtnConsultDoctor(sender:)), for: .touchUpInside)
        
        viewAppointment.backgroundColor = UIColor.secondaryColor
        viewAppointment.clipsToBounds = true
        viewAppointment.layer.cornerRadius = viewDoctor.frame.size.height / 2
        viewAppointment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBtnAppointment(sender:))))
        
        btnAppointment.setTitle("new_appointment".localizable(), for: .normal)
        btnAppointment.setTitleColor(UIColor.customColorWhite, for: .normal)
        btnAppointment.titleLabel?.font = UIFont.customFont(size: 12, customStyle: .Bold)
        btnAppointment.addTarget(self, action: #selector(tapBtnAppointment(sender:)), for: .touchUpInside)
    
    
        self.imgUnitCategory.kf.setImage(with: URL(string: self.imageUrl))
        self.lblTitle.text = self.subCategoryName
        self.lblDesc.attributedText = self.unitDescription.convertHtmlToAttributedStringWithCSS(font: self.lblDesc.font, csscolor: "black", lineheight: 5, csstextalign: "left")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.constTitle.constant = CGFloat(self.lblTitle.calculateMaxLines * 40)
    }
    
    // MARK: *** Button Tap Action
    @IBAction func tapBtnConsultDoctor(sender: AnyObject){
        print("Doctor")
    }
    
    @IBAction func tapBtnAppointment(sender: AnyObject){
        print("Appointment")
    }
    
}

extension UnitCategoryDetail{
    static let reuseId = "unitCategoryDetail"
    
    static func create(titleName: String, imageUrl: String, subCategoryName: String, unitDescription: String) -> UIViewController{
        let unitCategoryStoryBoard: UIStoryboard = UIStoryboard(name: "UnitCategory", bundle: .main)
        let unitCategoryDetail = unitCategoryStoryBoard.instantiateViewController(withIdentifier: reuseId) as! UnitCategoryDetail
        unitCategoryDetail.titleName = titleName
        unitCategoryDetail.imageUrl = imageUrl
        unitCategoryDetail.subCategoryName = subCategoryName
        unitCategoryDetail.unitDescription = unitDescription
        
        return unitCategoryDetail
    }
}
