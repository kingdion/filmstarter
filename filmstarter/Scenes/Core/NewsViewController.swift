//
//  NewsViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 3/6/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController : FSTopBaseView
{
    override func viewDidLoad()
    {
        self.firstColor = UIColor(hex: "#faa306");
        self.secondColor = UIColor(hex: "#fdd30a");
        self.headerName = "News";
        
        super.viewDidLoad();
    }
}
