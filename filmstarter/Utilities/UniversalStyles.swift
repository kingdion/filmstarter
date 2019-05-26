//
//  UniversalStyles.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import Hue

/*
    Univeral store for styles so they can be changed
    quickly on a global scale. e.g, menu colour can be changed
    by one variable here. Good for extensibility.
*/

struct UniversalStyles
{
    struct Colours
    {
    }
    
    struct Fonts
    {
        static var FSButtonLabel : UIFont = UIFont(name: "Helvetica-Bold", size: 22)!;
        static var FSTitleLabel : UIFont = UIFont(name: "Helvetica-Bold", size: 32)!;
    }
}
