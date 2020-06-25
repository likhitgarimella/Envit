//
//  PersonalProjectViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class PersonalProjectViewController: UIViewController {
    
    // Outlets
    @IBOutlet var projectTitle: UITextField!
    @IBOutlet var roleOption: DropDown!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        projectTitle.layer.borderColor = myColor.cgColor
        projectTitle.layer.borderWidth = 1.6
        roleOption.layer.borderColor = myColor.cgColor
        roleOption.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        projectTitle.layer.cornerRadius = 4
        roleOption.layer.cornerRadius = 22

        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields on LEFT
        projectTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: projectTitle.frame.height))
        projectTitle.leftViewMode = .always
        roleOption.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: roleOption.frame.height))
        roleOption.leftViewMode = .always
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        
    }
    
}   // #58
