//
//  TestViewController.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/25/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITextFieldDelegate {

    //Properties
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var loginLabel: CustomLabel!
    @IBOutlet weak var goodToSeeYouLable: UILabel!
    
    @IBOutlet weak var topConstrainst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        /*
         
         UIView.animateWithDuration(1.0,
         delay: 2.0,
         options: .CurveEaseInOut | .AllowUserInteraction,
         animations: {
         self.bug.center = CGPoint(x: 230, y: 250)
         },
         completion: { finished in
         println("Bug moved right!")
         self.faceBugLeft()
         })
         
         */

        UIView.animate(withDuration: 0.2, delay: 2.0, options: .curveEaseInOut, animations: {
            self.navigationController?.navigationBar.isHidden = true
            self.loginLabel.isHidden = true
            self.goodToSeeYouLable.isHidden = true
            self.topConstrainst.constant = CGFloat(-20)
        }, completion: nil)
        
//        UIView.animate(withDuration: 0.9) {
//            self.navigationController?.navigationBar.isHidden = true
//            print("Begin editing")
//            self.topConstrainst.constant = CGFloat(30)
//        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        topConstrainst.constant = CGFloat(78)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        topConstrainst.constant = CGFloat(78)
        self.navigationController?.navigationBar.isHidden = false
        self.loginLabel.isHidden = false
        self.goodToSeeYouLable.isHidden = false
        return true
    }

}
