//
//  FSButton.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class FSButton : UIButton
{
    @IBInspectable var firstColor : String = "#ffffff";
    @IBInspectable var secondColor : String = "#ffffff";
    @IBInspectable var titleColor : String = "#000000";
    
    override func draw(_ rect: CGRect)
    {
        self.titleLabel!.font = UniversalStyles.Fonts.FSButtonLabel;
        calculateGradient(firstColor, secondColor);
        self.setTitleColor(UIColor(hex: titleColor), for: UIControl.State.normal);
        self.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 22);
    }
    
    func calculateGradient(_ firstColor : String, _ secondColor : String)
    {
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
        self.layer.cornerRadius = 50.0;
    }
}
