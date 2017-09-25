//
//  CustomNavigationController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInvinsibleBar()
        //navigationBar.frame.origin.y = 20
    }

    override func viewDidAppear(_ animated: Bool) {
        //navigationBar.frame.origin.y = 20
        //makeInvinsibleBar()
    }
    
    //Make navigation bar Invinsible
    func makeInvinsibleBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
