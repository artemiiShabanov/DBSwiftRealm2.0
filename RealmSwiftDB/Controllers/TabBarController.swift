//
//  tabBarController.swift
//  RealmSwiftDB
//
//  Created by Kuroyan Juliett on 28.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        print("!")
    }
    
    @IBAction func addButtonPress(_ sender: Any) {
        var vc: UIViewController!
        switch selectedViewController?.restorationIdentifier {
        case BooksViewController.ID:
            vc = storyboard?.instantiateViewController(withIdentifier: "EditAddBook")
        case FriendsViewController.ID:
            vc = storyboard?.instantiateViewController(withIdentifier: "EditAddFriend")
        default: return
        }
        navigationController?.pushViewController(vc, animated: true)

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        navigationItem.rightBarButtonItem?.isEnabled = selectedViewController?.restorationIdentifier == BooksViewController.ID || selectedViewController?.restorationIdentifier == FriendsViewController.ID
    }
}
