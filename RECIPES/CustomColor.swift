//
//  CustomColor.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/7/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import Foundation
import UIKit
import Chameleon

//This is a custom class to return orange color 
//gradient
struct CustomColor {
    
    var customOrange: UIColor!
    
    init(withFrame: CGRect) {
        
        let firstColor = UIColor(hexString: "FF8C2B", withAlpha: 1)
        let secondColor = UIColor(hexString: "FF6322", withAlpha: 1)
        
        customOrange = UIColor(gradientStyle: .leftToRight, withFrame: withFrame, andColors: [firstColor!, secondColor!])
    }
    
    //Gets the orange color 
    func getColor() -> UIColor {
        return customOrange
    }
    
}
