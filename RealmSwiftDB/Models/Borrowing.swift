//
//  Borrowing.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import RealmSwift

class Borrowing: Object {
    @objc dynamic var book: Book? = nil
    @objc dynamic var friend: Friend? = nil
    @objc dynamic var borrowDate = NSDate()
    
    @objc dynamic var isLost = false
    @objc dynamic var isDamaged = false
    @objc dynamic var returnDate: NSDate? = nil
    @objc dynamic var comment: String? = nil
}
