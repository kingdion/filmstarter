//
//  CalenderViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 3/6/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class CalendarViewController : FSTopBaseView
{
    override func viewDidLoad()
    {
        self.firstColor = UIColor(hex: "#01d4fe");
        self.secondColor = UIColor(hex: "#039dfd");
        self.headerName = "Calendar";
        
        super.viewDidLoad();
    }
}
