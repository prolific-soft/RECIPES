//
//  SignUpViewControllerTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class SignUpViewControllerTwo: UIViewController {
    
    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Pops the current VC in stack
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    //Hides the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
