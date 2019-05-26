//
//  FSInput.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import Hue

class FSInput : UITextField
{
    /*
     For display purposes, add an edge inset
     to the input fields. Since there are multiple
     layers to the UITextField, we override
     all of the rects to have this inset.
    */
    
    let padding = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func draw(_ rect: CGRect)
    {
        self.font = UniversalStyles.Fonts.FSButtonLabel;
        self.textColor = UIColor.darkGray;
        self.layer.backgroundColor = UIColor(hex: "#eeeeee").cgColor;
        self.layer.cornerRadius = 10.0;
        
        self.autocorrectionType = .no;
        self.autocapitalizationType = .none;
        self.clearButtonMode = .always;
    }
}
