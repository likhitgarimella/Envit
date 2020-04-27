//
//  SignUpViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    // Outlets
    @IBOutlet var name: UITextField!
    @IBOutlet var block: UITextField!
    @IBOutlet var phoneNo: UITextField!
    @IBOutlet var pass: UITextField!
    @IBOutlet var confirmPass: UITextField!
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
        block.layer.borderColor = myColor.cgColor
        block.layer.borderWidth = 1.6
        phoneNo.layer.borderColor = myColor.cgColor
        phoneNo.layer.borderWidth = 1.6
        pass.layer.borderColor = myColor.cgColor
        pass.layer.borderWidth = 1.6
        confirmPass.layer.borderColor = myColor.cgColor
        confirmPass.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        name.layer.cornerRadius = 4
        block.layer.cornerRadius = 4
        phoneNo.layer.cornerRadius = 4
        pass.layer.cornerRadius = 4
        confirmPass.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        name.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: name.frame.height))
        name.leftViewMode = .always
        block.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: block.frame.height))
        block.leftViewMode = .always
        phoneNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: phoneNo.frame.height))
        phoneNo.leftViewMode = .always
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: pass.frame.height))
        pass.leftViewMode = .always
        confirmPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: confirmPass.frame.height))
        confirmPass.leftViewMode = .always
        
    }
    
    func ButtonProp() {
        
        // Button Properties
        registerOutlet.layer.cornerRadius = 6
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToHome", sender: self)
        
    }
    
}   // #92
