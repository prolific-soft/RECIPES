//
//  LoginSignUpViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/7/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit
import Chameleon

class LoginSignUpViewController: UIViewController {

    //UI Properties
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: CustomButton!
    
    //First Loading Func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    
    //Set up UI properties
    func setUpViews() {
        self.navigationController?.navigationBar.frame.origin.y = 20
        signUpButton.makeBacgroundWhiteWithBorder()
        
    }
    
    //Hides status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
