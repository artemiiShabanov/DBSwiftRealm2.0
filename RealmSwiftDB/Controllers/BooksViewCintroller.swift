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
    
    static let ID = "BooksViewController_ID"
    
    var book: Book? = nil
    var books: [Book] = []
    var genreFilter: Genre? = nil
    var pubHouseFilter: PublishingHouse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*try! realm.write {
            let genre = Genre()
            genre.name = "aaaa"
            let book = Book()
            book.name = "a"
            book.author = "author"
            book.pubYear = 2010
            book.translator = "au1"
            realm.add(genre)
            book.genres.append(genre)
            realm.add(book)
        }*/
        
        //filteres by genre
        if let filter = genreFilter {
            
            books = realm.objects(Book.self).filter(NSPredicate(format: "%@ IN genres", filter)).map{$0}
            let subgenres = getSubgenres(for: filter)
            
            for subgenre in subgenres {
                books.append(contentsOf: realm.objects(Book.self).filter(NSPredicate(format: "%@ IN genres", subgenre)).map{$0})
            }

            tableView.reloadData()
            return
        }
        
        //filtered by publication house
        if let filter = pubHouseFilter {
            books = realm.objects(Book.self).filter(NSPredicate(format: "pubHouse == %@", filter)).map{$0}
            tableView.reloadData()
            return
        }
        //no any filtration
        books = realm.objects(Book.self).map{$0}
        tableView.reloadData()
    }
    
    func getSubgenres(for genre: Genre) -> [Genre] {
        var subgenres: [Genre] = realm.objects(Genre.self).filter(NSPredicate(format: "parentGenre == %@", genre)).map{$0}
        
        for g in subgenres {
            subgenres.append(contentsOf: getSubgenres(for: (g)))
        }
        return subgenres
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if genreFilter ==  nil && pubHouseFilter == nil {
            books = realm.objects(Book.self).map{$0}
        }
        tableView.reloadData()
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
        book = books[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "BookInfoSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookInfoViewController {
            destination.book = book!
        }
    }
}
