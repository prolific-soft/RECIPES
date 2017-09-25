//
//  LogInViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/8/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    //UI Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //First loading Func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewProperties()
    }

    //Pops current VC in stack
    @IBAction func backButton_Touch_Up_Inside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    //Sets up the view properties
    func setUpViewProperties() {
         self.navigationController?.navigationBar.frame.origin.y = 20
    }
    
    //Hides status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
