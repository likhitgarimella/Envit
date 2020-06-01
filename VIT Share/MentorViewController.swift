//
//  MentorViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController {
    
    // Outlets
    @IBOutlet var domain: DropDown!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        domain.layer.borderColor = myColor.cgColor
        domain.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        domain.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        domain.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: domain.frame.height))
        domain.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For Credits TextFields
        domain.optionArray = ["iOS App Development", "Android App Development", "Web Development", "Node.js", "Machine Learning", "Flutter", "React Native", "Design"]
        domain.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        
    }

}   // #60
