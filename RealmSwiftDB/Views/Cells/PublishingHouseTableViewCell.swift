//
//  PublishingHouseTableViewCell.swift
//  realmProject
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class PublishingHouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PublishingHouseLabel: UILabel!
    public static let reuseId = "PublishingHouseTableViewCell_reuseId"
    
    public func set(name: String) {
        PublishingHouseLabel.text = name
    }
    
}
