//
//  FriendsViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsViewController: UITableViewController {

    static let ID = "FriendsViewController_ID"
    
    var friend: Friend? = nil
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        friends = realm.objects(Friend.self).map{$0}
        tableView.reloadData()
        
//        
//        let genre1 = Genre()
//        genre1.name = "ДЕТЕКТИВЫ"
//        
//        let genre2 = Genre()
//        genre2.name = "Исторические детективы"
//        
//        let genre3 = Genre()
//        genre3.name = "Классические детективы"
//        
//        let genre4 = Genre()
//        genre4.name = "ДОКУМЕНТАЛЬНЫЕ"
//        
//        let genre5 = Genre()
//        genre5.name = "Искусство"
//        
//        let genre6 = Genre()
//        genre6.name = "Биографии и Мемуары"
//        
//        try! realm.write {
//            realm.deleteAll()
//            realm.add(genre1)
//            realm.add(genre2)
//            realm.add(genre3)
//            realm.add(genre4)
//            realm.add(genre5)
//            realm.add(genre6)
//        }
//        
//        let publHouse1 = PublishingHouse()
//        publHouse1.name = "publHouse1"
//        
//        let publHouse2 = PublishingHouse()
//        publHouse2.name = "publHouse2"
//        
//        let publHouse3 = PublishingHouse()
//        publHouse3.name = "publHouse3"
//        
//        let publHouse4 = PublishingHouse()
//        publHouse4.name = "publHouse4"
//        
//        try! realm.write {
//            realm.add(publHouse1)
//            realm.add(publHouse2)
//            realm.add(publHouse3)
//            realm.add(publHouse4)
//        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseId) as? FriendTableViewCell
            else {
                fatalError("Fatal error")
        }
        cell.set(name: friends[indexPath.row].FIO)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        friend = friends[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "FriendInfoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FriendInfoViewController {
            destination.friend = friend!
        }
    }
}

