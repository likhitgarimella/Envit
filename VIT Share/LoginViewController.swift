//
//  LoginViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet var emailId: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var loginOutlet: UIButton!
    @IBOutlet var signupOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        ButtonProp()

    }
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        emailId.layer.borderColor = myColor.cgColor
        emailId.layer.borderWidth = 1.6
        password.layer.borderColor = myColor.cgColor
        password.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        emailId.layer.cornerRadius = 4
        password.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        emailId.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailId.frame.height))
        emailId.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.frame.height))
        password.leftViewMode = .always
        
    }
    
    func ButtonProp() {
        
        // Button Properties
        loginOutlet.layer.cornerRadius = 6
        signupOutlet.layer.cornerRadius = 6
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        // dismiss keyboard
        view.endEditing(true)
        
        // validations
        guard let email = emailId.text, let password = password.text else {
            print("Invalid Form Input")
            return
        }
        
        AuthService.signIn(email: email, password: password, onSuccess: {
            print("On Success")
            // segue to tab bar VC
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }, onError: {errorString in
            // this will be the one which prints error due to auth, in console
            print(errorString!)
        })
        
    }
    
    @IBAction func signupTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignup", sender: self)
        
    }
    
}   // #98
