//
//  AlertHelper.swift
//  filmstarter
//
//  Created by Dion Misic on 26/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper
{
    static func showError(on view : UIViewController, message : String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        view.present(alert, animated: true, completion: nil)
    }
}
