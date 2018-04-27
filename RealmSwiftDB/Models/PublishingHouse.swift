//
//  PublishingHouse.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import RealmSwift

class PublishingHouse: Object {
    @objc dynamic let idHouse = UUID().uuidString
    @objc dynamic var name: String = ""
    
   // override static func primaryKey() -> String? {
    //    return "idHouse"
    //}
}


