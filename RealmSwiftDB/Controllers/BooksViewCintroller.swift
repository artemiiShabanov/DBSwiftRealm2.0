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
    
    var books: [Book] = []
    var genreFilter: Genre? = nil
    var pubHouseFilter: PublishingHouse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //filteres by genre
        if let filter = genreFilter {
            books = realm.objects(Book.self).map{$0}
            var booksTmp = [Book]()
            for book in books {
                if book.genres.contains(filter) {
                    booksTmp.append(book)
                }
            }
            books = booksTmp
            return
        }
        //filtered by publication house
        if let filter = pubHouseFilter{
            books = realm.objects(Book.self).filter(NSPredicate(format: "pubHouse == %@", filter)).map{$0}
            return
        }
        //no any filtration
        books = realm.objects(Book.self).map{$0}
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
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
