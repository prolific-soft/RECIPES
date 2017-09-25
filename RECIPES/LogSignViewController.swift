//
//  LogSignViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit
import Foundation

class LogSignViewController: UIViewController {

    //UI Properties
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: CustomLabelTwo!
    @IBOutlet weak var signUpButton: CustomButtonTwo!
    
    //First Loading Func
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
    }

    //Sets up the UI properties
    func setUpProperties(){
        signUpButton.makeWhiteBackgroundWithBorder()
        dontHaveAccountLabel.setSpacing(space: 1)
        navigationController?.navigationBar.frame.origin.y = 20
    }
    
    //Brings nav bar down by 20 pt
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.frame.origin.y = 20
    }
    
    //Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

}
