//
//  FriendTableViewCell.swift
//  realmProject
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FriendLabel: UILabel!
    public static let reuseId = "FriendTableViewCell_reuseId"
    
    public func set(name: String) {
        FriendLabel.text = name
    }
    
}
