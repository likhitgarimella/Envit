//
//  SignUpViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
import JGProgressHUD

class SignUpViewController: UIViewController {
    
    // Outlets
    @IBOutlet var name: UITextField!
    @IBOutlet var emailId: UITextField!
    @IBOutlet var phoneNo: UITextField!
    @IBOutlet var block: UITextField!
    @IBOutlet var pass: UITextField!
    
    @IBOutlet var registerOutlet: UIButton!
    
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
        name.layer.borderColor = myColor.cgColor
        name.layer.borderWidth = 1.6
        emailId.layer.borderColor = myColor.cgColor
        emailId.layer.borderWidth = 1.6
        phoneNo.layer.borderColor = myColor.cgColor
        phoneNo.layer.borderWidth = 1.6
        block.layer.borderColor = myColor.cgColor
        block.layer.borderWidth = 1.6
        pass.layer.borderColor = myColor.cgColor
        pass.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        name.layer.cornerRadius = 4
        emailId.layer.cornerRadius = 4
        phoneNo.layer.cornerRadius = 4
        block.layer.cornerRadius = 4
        pass.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        name.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: name.frame.height))
        name.leftViewMode = .always
        emailId.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailId.frame.height))
        emailId.leftViewMode = .always
        phoneNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: phoneNo.frame.height))
        phoneNo.leftViewMode = .always
        block.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: block.frame.height))
        block.leftViewMode = .always
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: pass.frame.height))
        pass.leftViewMode = .always
        
    }
    
    func ButtonProp() {
        
        // Button Properties
        registerOutlet.layer.cornerRadius = 6
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        // dismiss keyboard
        view.endEditing(true)
        
        // Progress HUD
        let hud1 = JGProgressHUD(style: .dark)
        // hud1.textLabel.text = "Please Wait..."
        hud1.show(in: self.view)
        
        // validations
        guard let email = emailId.text, let password = pass.text, let name = name.text, let phone = phoneNo.text, let block = block.text else {
            print("Invalid Form Input")
            return
        }
        
        // Auth service sign up
        AuthService.signUp(name: name, email: email, phone: phone, block: block, password: password, onSuccess: {
            print("On Success")
            hud1.indicatorView = nil    // remove indicator
            hud1.textLabel.text = "Welcome!"
            hud1.dismiss(afterDelay: 2.0, animated: true)
            // segue to tab bar VC
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }) {errorString in
            // this will be the one which prints error due to auth, in console
            print(errorString!)
            hud1.indicatorView = nil    // remove indicator
            hud1.textLabel.text = errorString!
            hud1.dismiss(afterDelay: 2.0, animated: true)
        }
        
    }
    
}   // #122
