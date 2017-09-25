//
//  CustomLabelTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomLabelTwo: UILabel {

    //First loadin func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultSpacing()
    }
    
    //First loading required func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaultSpacing()
    }
    
    //Sets the title to a default
    //spacing of 1.5
    func setDefaultSpacing(){
        let labelSpacing = 1.5
        let labelAttributedString = NSMutableAttributedString(string: text!)
        labelAttributedString.addAttribute(NSAttributedStringKey.kern, value:labelSpacing, range: NSMakeRange(0, labelAttributedString.length))
        self.attributedText = labelAttributedString
    }
    
    //Set the title spacing to the
    //provided argument
    func setSpacing(space: CGFloat){
        let labelAttributedString = NSMutableAttributedString(string: text!)
        labelAttributedString.addAttribute(NSAttributedStringKey.kern, value:space, range: NSMakeRange(0, labelAttributedString.length))
        self.attributedText = labelAttributedString
    }

}
