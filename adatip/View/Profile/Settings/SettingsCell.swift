//
//  SettingsCell.swift
//  adatip
//
//  Created by Onur YILMAZ on 28.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let reuseID = "settingsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SettingsCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var lblContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
