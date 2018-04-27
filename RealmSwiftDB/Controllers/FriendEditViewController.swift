//
//  FriendEditViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class FriendEditViewController: UIViewController {
    
    var friend:Friend? = nil
    
    @IBOutlet weak var FIOTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var socialNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        
        if let selectedFriend = friend {
            FIOTextField.text = selectedFriend.FIO
            phoneNumberTextField.text = String(selectedFriend.phoneNumber)
            socialNumberTextField.text = selectedFriend.socialNumber
            emailTextField.text = selectedFriend.email
            commentTextField.text = selectedFriend.comment
        }
    }
    
    @IBAction func saveButtonPress(_ sender: Any) {
        if let _friend = friend {
            try! realm.write {
                _friend.FIO = FIOTextField.text!
                _friend.phoneNumber = Int(phoneNumberTextField.text!)!
                _friend.socialNumber = socialNumberTextField.text!
                _friend.email = emailTextField.text!
                _friend.comment = commentTextField.text!
            }
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
}

