//
//  UIExtensions.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 27.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
