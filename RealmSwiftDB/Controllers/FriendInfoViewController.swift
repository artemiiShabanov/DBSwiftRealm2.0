//
//  FriendInfoViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class FriendInfoViewController: UIViewController, Givable, UITableViewDelegate, UITableViewDataSource {
    
    var friend:Friend? = nil
    
    var giveView: GiveView!
    var books: [Book]!

    @IBOutlet weak var FIOLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var socialNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var giveButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let selectedFriend = friend {
            FIOLabel.text = selectedFriend.FIO
            phoneNumberLabel.text = String(selectedFriend.phoneNumber)
            socialNumberLabel.text = selectedFriend.socialNumber
            emailLabel.text = selectedFriend.email
            commentLabel.text = selectedFriend.comment
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FriendEditViewController {
            destination.friend = friend!
        }
    }
    
    @IBAction func giveButtonPress(_ sender: Any) {
        guard giveView == nil else {
            return
        }
        
        // ??
        let booksSet = Set(realm.objects(Borrowing.self).map{Book(value: $0.book)})
        let allBooks = Set(realm.objects(Book.self))
        books = Array(allBooks.subtracting(booksSet))
        
        giveView = GiveView()
        giveView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "friendCell")
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
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(books[indexPath.row].name) \(books[indexPath.row].author)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let borrowing = Borrowing()
        borrowing.book = books[indexPath.row]
        borrowing.friend = friend
        borrowing.borrowDate = NSDate()
        
        try! realm.write {
            realm.add(borrowing)
        }
        
        giveView.hide()
        giveView = nil
        self.navigationController?.navigationBar.isHidden = false
    }
}

