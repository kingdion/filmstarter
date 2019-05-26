//
//  TeamViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class TeamViewController : FSBaseViewController {
    override func viewDidLoad()
    {
        super.includeScrollView = true;
        super.includeLogo = true;
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.red;
    }
}
