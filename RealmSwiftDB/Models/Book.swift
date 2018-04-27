//
//  Book.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import RealmSwift

class Book: Object {
    @objc dynamic let idBook = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var pubYear = 2000
    @objc dynamic var picAuthor: String? = nil
    @objc dynamic var translator: String? = nil
    @objc dynamic var author = ""
    @objc dynamic var comment: String? = nil
    @objc dynamic var pubHouse: PublishingHouse? = nil
    let genres = List<Genre>()
    
    //override static func primaryKey() -> String? {
      //  return "idBook"
   // }
}
