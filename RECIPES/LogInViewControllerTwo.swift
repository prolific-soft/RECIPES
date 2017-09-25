//
//  LogInViewControllerTwo.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class LogInViewControllerTwo: UIViewController {

    //UI Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewProperties()
    }

    //Sets up the view properties
    func setUpViewProperties(){
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
