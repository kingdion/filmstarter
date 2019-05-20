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
        self.font = UIFont(name: "Helvetica-Bold", size: 22);
        self.textColor = UIColor.darkGray;
        self.layer.backgroundColor = UIColor(hex: "#eeeeee").cgColor;
        self.layer.cornerRadius = 10.0;
    }
}
