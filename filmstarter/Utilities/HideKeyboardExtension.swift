//
//  HideKeyboardExtension.swift
//  filmstarter
//
//  Created by Dion Misic on 26/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

/*

 Reused solution pulled from https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
 Elegant way to hide the keyboard on tap gesture outside of the keyboard.
 A nice usability feature which makes the app more fluid to use.
 
*/

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
