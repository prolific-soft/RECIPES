//
//  LogInViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/8/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    //UI Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInLabel: CustomLabel!
    @IBOutlet weak var goodToSeeYouLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
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
         //self.navigationController?.navigationBar.frame.origin.y = 20
    }
    
 
}



//MARK: -Keyboard Hide/Show
extension LogInViewController {
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationController?.navigationBar.isHidden = true
        self.logInLabel.isHidden = true
        self.goodToSeeYouLabel.isHidden = true
        self.topConstraint.constant = CGFloat(10)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        topConstraint.constant = CGFloat(74)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.navigationController?.navigationBar.isHidden = false
        self.logInLabel.isHidden = false
        self.goodToSeeYouLabel.isHidden = false
        self.topConstraint.constant = CGFloat(74)
        textField.resignFirstResponder()
        return true
    }

    
}









