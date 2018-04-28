//
//  FriendInfoViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class FriendInfoViewController: UIViewController {
    
    var friend:Friend? = nil
    
    @IBOutlet weak var FIOLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var socialNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
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
    }
}

