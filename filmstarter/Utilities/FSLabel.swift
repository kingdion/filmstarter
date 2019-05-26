//
//  FSLabel
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class FSLabel : UILabel {
    // Extension pulled from this solution to add kerning to UILabels, modified for my purposes.
    // https://stackoverflow.com/questions/27535901/ios-8-change-character-spacing-on-uilabel-within-interface-builder
    
    var kerning : Double = 0.0
    {
        didSet
        {
            if let labelText = text, labelText.count > 0
            {
                let attributedString = NSMutableAttributedString(string: labelText)
                attributedString.addAttribute(NSAttributedString.Key.kern, value: kerning, range: NSRange(location: 0, length: attributedString.length - 1))
                attributedText = attributedString
            }
        }
    }
}
