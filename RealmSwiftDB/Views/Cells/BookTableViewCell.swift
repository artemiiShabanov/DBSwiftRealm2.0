//
//  BookTableViewCell.swift
//  realmProject
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BookLabel: UILabel!
    public static let reuseId = "BookTableViewCell_reuseId"
    
    public func set(name: String) {
        BookLabel.text = name
    }
    
}
