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
    @IBOutlet var phoneNo: UITextField!
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
        phoneNo.layer.borderColor = myColor.cgColor
        phoneNo.layer.borderWidth = 1.6
        password.layer.borderColor = myColor.cgColor
        password.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        phoneNo.layer.cornerRadius = 4
        password.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        phoneNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: phoneNo.frame.height))
        phoneNo.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.frame.height))
        password.leftViewMode = .always
        
    }
    
    func ButtonProp() {
        
        // Button Properties
        loginOutlet.layer.cornerRadius = 6
        signupOutlet.layer.cornerRadius = 6
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToHome", sender: self)
        
    }
    
    @IBAction func signupTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignup", sender: self)
        
    }
    
}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}   // #96
