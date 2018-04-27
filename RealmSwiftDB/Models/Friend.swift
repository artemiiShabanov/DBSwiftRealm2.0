//
//  Friend.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import RealmSwift

class Friend: Object {
    @objc dynamic let idFriend = UUID().uuidString
    @objc dynamic var FIO = ""
    @objc dynamic var phoneNumber = 0
    @objc dynamic var socialNumber: String? = nil
    @objc dynamic var email = ""
    @objc dynamic var comment:String? = nil
    
    //override static func primaryKey() -> String? {
      //  return "idFriend"
    //}
}

