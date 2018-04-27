//
//  Genre.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import RealmSwift

class Genre: Object {
    @objc dynamic let idGenre = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var parentGenre: Genre? = nil
    let books = List<Book>()
    
   // override static func primaryKey() -> String? {
     //   return "idGenre"
   // }
}

