//
//  BookInfoViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class BookInfoViewController: UIViewController, Givable, UITableViewDelegate, UITableViewDataSource {
    
    var book: Book? = nil
    var giveView: GiveView!

    var friends: [Friend]!
    
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishingYearLabel: UILabel!
    @IBOutlet weak var picAuthorLabel: UILabel!
    @IBOutlet weak var translaterLabel: UILabel!
    @IBOutlet weak var publHouseLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var giveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedBook = book {
            nameLabel.text = selectedBook.name
            authorLabel.text = selectedBook.author
            publishingYearLabel.text = String(selectedBook.pubYear)
            picAuthorLabel.text = selectedBook.picAuthor
            translaterLabel.text = selectedBook.translator
            publHouseLabel.text = selectedBook.pubHouse?.name
            commentLabel.text = selectedBook.comment
            genresLabel.text = ""
            for genre in selectedBook.genres {
                genresLabel.text?.append(genre.name + " ")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let selectedBook = book {
            giveButton.isEnabled = realm.objects(Borrowing.self).filter(NSPredicate(format: "book == %@", selectedBook)).count == 0
 nameLabel.text = selectedBook.name
            authorLabel.text = selectedBook.author
            publishingYearLabel.text = String(selectedBook.pubYear)
            picAuthorLabel.text = selectedBook.picAuthor
            translaterLabel.text = selectedBook.translator
            publHouseLabel.text = selectedBook.pubHouse?.name
            commentLabel.text = selectedBook.comment
            genresLabel.text = ""
            for genre in selectedBook.genres {
                genresLabel.text?.append(genre.name + " ")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookEditViewController {
            destination.book = book!
        }
    }
    
    @IBAction func giveButtonPress(_ sender: Any) {
        guard giveView == nil else {
            return
        }
        

        friends = realm.objects(Friend.self).map{$0}

        giveView = GiveView()
        giveView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bookCell")
        giveView.tableView.delegate = self
        giveView.tableView.dataSource = self
        giveView?.onExitPress = {
            self.giveView = nil
            self.navigationController?.navigationBar.isHidden = false
        }
        
        giveView.show(in: self)
        navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(friends[indexPath.row].FIO)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let borrowing = Borrowing()
        borrowing.book = book
        borrowing.friend = friends[indexPath.row]
        borrowing.borrowDate = NSDate()

        try! realm.write {
            realm.add(borrowing)
        }

        giveView.hide()
        self.navigationController?.navigationBar.isHidden = false
    }
}
