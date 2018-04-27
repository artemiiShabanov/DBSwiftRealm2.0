//
//  BooksViewCintroller.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit
import RealmSwift

class BooksViewController: UITableViewController {
    
    var books: Results<Book>!
    var genreFilter: Genre? = nil
    var pubHouseFilter: PublishingHouse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        
        try! realm.write {
            let book = Book()
            book.name = book.idBook
            realm.add(book)
        }
        books = realm.objects(Book.self)
        
        if genreFilter != nil {
            books = books.filter("genres.contains(filter)")
        }
        if pubHouseFilter != nil {
            books = books.filter("pubHouse == filter")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.reuseId) as? BookTableViewCell
            else {
                fatalError("Fatal error")
        }
        cell.set(name: books[indexPath.row].name)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*word = words[indexPath.row]
         tableView.deselectRow(at: indexPath, animated: true)
         segueTarget = .Word
         self.performSegue(withIdentifier: , sender: self)*/
    }
}
