//
//  CustomButton.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/8/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    //First loading Func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomViewProperty()
    }
    //First required Func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       setCustomViewProperty()
    }

    //Sets the corner radius, custom color and
    //sets spacing for the title label
    func setCustomViewProperty(){
        let orange = CustomColor(withFrame: frame).getColor()
        
        self.backgroundColor = orange
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        
        let spacing = 1.5
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSMakeRange(0, attributedString.length))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    //Sets the backgroud to white and makes
    //the border thin with a custom color
    func makeBacgroundWhiteWithBorder(){
        let orange = CustomColor(withFrame: frame).getColor()
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1.5
        self.layer.borderColor = orange.cgColor
        self.layer.cornerRadius = 25
    }
    
}
