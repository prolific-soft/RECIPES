//
//  CustomTextFieldTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomTextFieldTwo: UITextField {

    //First loading func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewProperty()
    }
    
    //First required func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViewProperty()
    }
    
    //Sets up the borderwidth to 1 with
    //a gray color. Also adds padding to 
    //placeholder with a color
    func setUpViewProperty(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexString: "E0E0E0").cgColor
        self.attributedPlaceholder = NSMutableAttributedString(string: placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor(hexString: "9E9E9E")])
        self.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }

}
