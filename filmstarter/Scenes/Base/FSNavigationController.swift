//
//  FSNavigationController.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*

    The base navigation controller which controls
    the profile view(s). We set the background image to nothing
    to make the bar transparent, to work with our views.
 
*/
class FSNavigationController : UINavigationController
{
    override func viewDidLoad()
    {
        self.navigationBar.tintColor = UIColor.white;
        self.navigationBar.setBackgroundImage(UIImage(), for: .default);
        self.navigationBar.shadowImage = UIImage();
        self.navigationBar.isTranslucent = true;
        self.view.backgroundColor = .clear;
    }
}
