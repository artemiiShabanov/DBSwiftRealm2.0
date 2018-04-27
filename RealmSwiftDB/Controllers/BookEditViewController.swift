//
//  BookEditViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class BookEditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var book: Book? = nil
    var houses: [String] = [String]()
    var selectedHouse: PublishingHouse? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publYearTextField: UITextField!
    @IBOutlet weak var picAuthorTextField: UITextField!
    @IBOutlet weak var translaterTextField: UITextField!
    @IBOutlet weak var publHousePickerView: UIPickerView!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        publYearTextField.keyboardType = UIKeyboardType.numberPad
        
        for house in realm.objects(PublishingHouse.self) {
            houses.append(house.name)
        }
        publHousePickerView.dataSource = self
        publHousePickerView.delegate = self
        
        if let selectedBook = book {
            nameTextField.text = selectedBook.name
            authorTextField.text = selectedBook.author
            publYearTextField.text = String(selectedBook.pubYear)
            picAuthorTextField.text = selectedBook.picAuthor
            translaterTextField.text = selectedBook.translator
            commentTextView.text = selectedBook.comment
        }
    }
    
    @IBAction func saveButtonPress(_ sender: Any) {
        
        if let _book = book {
            try! realm.write {
                _book.name = nameTextField.text!
                _book.author = authorTextField.text!
                _book.pubYear =  Int(publYearTextField.text!)!
                _book.picAuthor = picAuthorTextField.text!
                _book.translator = translaterTextField.text!
                _book.comment = commentTextView.text!
                _book.pubHouse = selectedHouse
            }
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return houses.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return houses[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHouse = realm.objects(PublishingHouse.self).filter("name = %@", houses[row]).first
    }
}

