//
//  TeamSettingsViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 3/6/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class TeamSettingsViewController : FSTopBaseView
{
    override func viewDidLoad()
    {
        self.firstColor = UIColor(hex: "#373737");
        self.secondColor = UIColor(hex: "#5f5f5f");
        self.headerName = "Settings";
        
        super.viewDidLoad();
    }
}
