//
//  BookEditViewController.swift
//  realmProject
//
//  Created by Kuroyan Juliett on 26.04.18.
//  Copyright © 2018 C3G9. All rights reserved.
//

import UIKit

class BookEditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var book: Book? = nil
    var houses: [String] = [String]()
    var selectedHouse: PublishingHouse? = nil
    var genres: [Genre] = []

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publYearTextField: UITextField!
    @IBOutlet weak var picAuthorTextField: UITextField!
    @IBOutlet weak var translaterTextField: UITextField!
    @IBOutlet weak var publHousePickerView: UIPickerView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var genresTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
//        self.view.addGestureRecognizer(gestureRecognizer)
        publYearTextField.keyboardType = UIKeyboardType.numberPad
        
        for house in realm.objects(PublishingHouse.self) {
            houses.append(house.name)
        }
        publHousePickerView.dataSource = self
        publHousePickerView.delegate = self
        
        genresTableView.delegate = self
        genresTableView.dataSource = self

        genresTableView.allowsSelection = true
        genresTableView.allowsMultipleSelection = true

        if let selectedBook = book {
            nameTextField.text = selectedBook.name
            authorTextField.text = selectedBook.author
            publYearTextField.text = String(selectedBook.pubYear)
            picAuthorTextField.text = selectedBook.picAuthor
            translaterTextField.text = selectedBook.translator
            commentTextView.text = selectedBook.comment
            if let ph = selectedBook.pubHouse {
                publHousePickerView.selectRow(houses.index(of: ph.name)!, inComponent: 0, animated: false)
                selectedHouse = ph
            }
        }
        genres = realm.objects(Genre.self).map{$0}
 }
    
    @objc func hideKeyboard() {
        nameTextField.resignFirstResponder()
        authorTextField.resignFirstResponder()
        publYearTextField.resignFirstResponder()
        translaterTextField.resignFirstResponder()
        commentTextView.resignFirstResponder()
    }

    @IBAction func saveButtonPress(_ sender: Any) {
        
        if let _book = book {
            try! realm.write {
                _book.name = nameTextField.text!
                _book.author = authorTextField.text!
                _book.pubYear =  Int(publYearTextField.text != "" ? publYearTextField.text! : "2000")!
                _book.picAuthor = picAuthorTextField.text!
                _book.translator = translaterTextField.text!
                _book.comment = commentTextView.text!
                _book.pubHouse = selectedHouse
                _book.genres.removeAll()
                for ip in genresTableView.indexPathsForSelectedRows ?? [] {
                    _book.genres.append(genres[ip.row])
                }

            }
        } else {
            book = Book()
            book!.name = nameTextField.text!
            book!.author = authorTextField.text!
            book!.pubYear =  Int(publYearTextField.text != "" ? publYearTextField.text! : "2000")!
            book!.picAuthor = picAuthorTextField.text!
            book!.translator = translaterTextField.text!
            book!.comment = commentTextView.text!
            book!.pubHouse = selectedHouse
            book!.genres.removeAll()
            for ip in genresTableView.indexPathsForSelectedRows ?? [] {
                book!.genres.append(genres[ip.row])
            }

            try! realm.write {
                realm.add(book!)
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
        if let selectedBook = book {
            if (houses[row] == selectedBook.pubHouse?.name) {
                pickerView.selectRow(row, inComponent: component, animated: false)
            }
        }
        return houses[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHouse = realm.objects(PublishingHouse.self).filter("name = %@", houses[row]).first
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(genres[indexPath.row].name)"
        if let selectedBook = book {
            if (selectedBook.genres.map{$0.name}.contains(genres[indexPath.row].name)) {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
        return cell
    }
}

