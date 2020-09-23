//
//  AnnouncementDetail.swift
//  adatip
//
//  Created by Onur YILMAZ on 22.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class AnnouncementDetail: BaseViewController {

    @IBOutlet weak var imgAnnouncement: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var constTitle: NSLayoutConstraint!
    
    var announcementId = Int()
    var longTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
        getAnnouncementDetail(announcementId: self.announcementId)
    }
    
    private func setupViewComponents(){
        self.setupNavigationBar(titleName: "announcement_detail", subtitle: "(" + self.hospitalTitle + ")")
        
        initBarButtonNotification()
        
        imgAnnouncement.contentMode = .scaleToFill
        imgAnnouncement.clipsToBounds = true
        imgAnnouncement.layer.cornerRadius = 25
        
        lblTitle.text = longTitle
        lblTitle.font = UIFont.customFont(size: 25, customStyle: .Bold)
        lblTitle.textColor = UIColor.primaryColor
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        
        lblDesc.font = UIFont.customFont(size: 14, customStyle: .Regular)
        lblDesc.textColor = UIColor.customColorBlack
        lblDesc.numberOfLines = 0
        lblDesc.sizeToFit()
        
    }
    
    private func getAnnouncementDetail(announcementId: Int){
        
        self.showProgressView(self.view)
        AnnouncementDetailViewModel.getAnnouncementDetail(announcementId: announcementId, complation: { (announcementDetail) in
            
            self.imgAnnouncement.kf.setImage(with: URL(string: announcementDetail.imageUrl ?? ""))
            self.lblDesc.attributedText = announcementDetail.fullDescription?.convertHtmlToAttributedStringWithCSS(font: self.lblDesc.font, csscolor: "black", lineheight: 5, csstextalign: "left")
            
            self.constTitle.constant = CGFloat(self.lblTitle.calculateMaxLines * 40)
            
            self.hideProgressView(self.view)
        }) { (errorMessage) in
            self.hideProgressView(self.view)
            self.showAlert(title: nil, message: errorMessage)
        }
    }
    
}

extension AnnouncementDetail{
    
    static let reuseId = "announcementDetail"
    
    static func create(announcementId: Int, longTitle: String) -> UIViewController{
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: .main)
        let announcementDetail = homeStoryBoard.instantiateViewController(withIdentifier: reuseId) as! AnnouncementDetail
        announcementDetail.announcementId = announcementId
        announcementDetail.longTitle = longTitle
        
        return announcementDetail
    }
}
