//
//  CustomTabBarController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
    }
    
    //Initial setup
    func setUpProperties(){
        let orange = CustomColor(withFrame: tabBar.frame).getColor()
        self.tabBar.tintColor = orange
        self.tabBar.backgroundColor = .white
    }
 

}
