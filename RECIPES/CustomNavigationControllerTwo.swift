//
//  CustomNavigationControllerTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CustomNavigationControllerTwo: UINavigationController {

    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBarInvisible()
    }

    //Makes the nav bar invisible
    func makeNavigationBarInvisible(){
        let image = UIImage()
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = image
    }
}
