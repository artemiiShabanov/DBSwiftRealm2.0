//
//  BookInfoViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class BookInfoViewController: UIViewController {
    
    var book: Book? = nil
    
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishingYearLabel: UILabel!
    @IBOutlet weak var picAuthorLabel: UILabel!
    @IBOutlet weak var translaterLabel: UILabel!
    @IBOutlet weak var publHouseLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookEditViewController {
            destination.book = book!
        }
    }
    
    @IBAction func giveButtonPress(_ sender: Any) {
    }
}
