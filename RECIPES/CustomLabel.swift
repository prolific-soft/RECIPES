//
//  CustomLabel.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/8/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    //First Laoding Func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextSpacing()
    }
    
    //First Required loading func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTextSpacing()
    }
    
    //Sets up the default text
    //spacing to 1.5
    func setUpTextSpacing(){
        let labelSpacing = 1.5
        let labelAttributedString = NSMutableAttributedString(string: self.text!)
        labelAttributedString.addAttribute(NSAttributedStringKey.kern, value: labelSpacing, range: NSMakeRange(0, labelAttributedString.length))
        self.attributedText = labelAttributedString
    }
    
    //Sets up the spacing of text
    func setSpacing(space: CGFloat){
        let labelAttributedString = NSMutableAttributedString(string: self.text!)
        labelAttributedString.addAttribute(NSAttributedStringKey.kern, value: space, range: NSMakeRange(0, labelAttributedString.length))
        self.attributedText = labelAttributedString
    }
    
}

















