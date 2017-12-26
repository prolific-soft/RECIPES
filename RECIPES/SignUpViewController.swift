//
//  SignUpViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    //Class Properties
    
    @IBOutlet weak var niceToSeeYouLabel: UILabel!
    @IBOutlet weak var signUpLabel: CustomLabel!
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewProperties()
    }

    //Sets up the view properties
    func setUpViewProperties() {
        //self.navigationController?.navigationBar.frame.origin.y = 20
    }
    
    //Pops the current VC on stack
    @IBAction func backButton_Touch_Up_Inside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
//    //Hides status bar
//    override var prefersStatusBarHidden: Bool{
//        return true
//    }

}


//Slide Up Keyboard
extension SignUpViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationController?.navigationBar.isHidden = true
        self.signUpLabel.isHidden = true
        self.niceToSeeYouLabel.isHidden = true
        self.topConstraint.constant = CGFloat(40)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        topConstraint.constant = CGFloat(80)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.navigationController?.navigationBar.isHidden = false
        self.signUpLabel.isHidden = false
        self.niceToSeeYouLabel.isHidden = false
        self.topConstraint.constant = CGFloat(80)
        textField.resignFirstResponder()
        return true
    }
}






