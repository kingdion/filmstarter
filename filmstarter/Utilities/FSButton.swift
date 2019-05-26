//
//  FSButton.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*
    A wrapper over the UIButton class to bring
    easy-to-use gradient functionality and an interface
    for creating rounded corners.
*/

class FSButton : UIButton
{
    var firstColor : String = "#ffffff";
    var secondColor : String = "#ffffff";
    var titleColor : String = "#000000";
    var cornerRadius : CGFloat = 50.0;
    var cornerMask : CACornerMask? = nil;
    
    override func draw(_ rect: CGRect)
    {
        self.titleLabel!.font = UniversalStyles.Fonts.FSButtonLabel;
        calculateGradient(firstColor, secondColor);
        
        self.setTitleColor(UIColor(hex: titleColor), for: UIControl.State.normal);
        self.titleLabel!.font = UniversalStyles.Fonts.FSButtonLabel;
    }
    
    func calculateGradient(_ firstColor : String, _ secondColor : String)
    {
        // Using the Hue library to create a gradient and
        // attach it to the button background
        
        var backgroundGradient : CAGradientLayer;
        backgroundGradient = [UIColor(hex: firstColor), UIColor(hex: secondColor)].gradient
        {
            gradient in
                gradient.startPoint = CGPoint(x: 0.3, y: 1);
                gradient.endPoint = CGPoint(x: 1, y: 0.3);
                return gradient;
        }
        
        backgroundGradient.frame = self.bounds;
        backgroundGradient.cornerRadius = 25.0;
        self.layer.insertSublayer(backgroundGradient, at: 0);
        self.layer.cornerRadius = cornerRadius;
        
        if (cornerMask != nil)
        {
            backgroundGradient.maskedCorners = cornerMask!
            self.layer.maskedCorners = cornerMask!
        }
    }
}
