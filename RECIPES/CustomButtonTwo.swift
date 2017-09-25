//
//  CustomButtonTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomButtonTwo: UIButton {

    //First loading func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
    }
    
    //First loading required func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpProperties()
    }
    
    //Sets up the color and corner radius
    //with a default spacing of 1.5
    func setUpProperties(){
        
        let orange = CustomColor(withFrame: frame).getColor()
        
        self.backgroundColor = orange
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        
        let spacing = 1.5
        let logInButtonAtrributedString = NSMutableAttributedString(string: (self.titleLabel?.text)!)
        logInButtonAtrributedString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSMakeRange(0, logInButtonAtrributedString.length))
        self.setAttributedTitle(logInButtonAtrributedString, for: .normal)
    }
    
    //Makes the background white with a
    //border color of custom orange
    func makeWhiteBackgroundWithBorder(){
        let orange = CustomColor(withFrame: frame).getColor()
        
        self.backgroundColor = .white
        self.layer.borderWidth = 2
        self.layer.borderColor = orange.cgColor
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }

}
