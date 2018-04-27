//
//  GenreTableViewCell.swift
//  realmProject
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet weak var GenreLabel: UILabel!
    public static let reuseId = "GenreTableViewCell_reuseId"
    
    public func set(name: String) {
        GenreLabel.text = name
    }

}
