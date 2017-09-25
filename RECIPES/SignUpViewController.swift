//
//  SignUpViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewProperties()
    }

    //Sets up the view properties
    func setUpViewProperties() {
        self.navigationController?.navigationBar.frame.origin.y = 20
    }
    
    //Pops the current VC on stack
    @IBAction func backButton_Touch_Up_Inside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //Hides status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
