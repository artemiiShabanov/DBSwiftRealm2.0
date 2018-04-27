//
//  GenreViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit
import RealmSwift

class GenresViewController: UITableViewController {
   
    var genres: Results<Genre>!
    var genre: Genre? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //genres = realm.objects(Genre.self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.reuseId) as? GenreTableViewCell
            else {
                fatalError("Fatal error")
        }
        cell.set(name: genres[indexPath.row].name)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genre = genres[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "GenreToBookSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BooksViewController {
            destination.genreFilter = genre!
        }
    }
    
}
