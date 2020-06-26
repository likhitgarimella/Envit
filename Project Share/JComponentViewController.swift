//
//  JComponentViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class JComponentViewController: UIViewController {
    
    // Outlets
    @IBOutlet var projectTitle: UITextField!
    @IBOutlet var courseTitle: UITextField!
    @IBOutlet var projDescTextView: UITextView!
    @IBOutlet var addProjectOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        projectTitle.layer.borderColor = myColor.cgColor
        projectTitle.layer.borderWidth = 1.6
        courseTitle.layer.borderColor = myColor.cgColor
        courseTitle.layer.borderWidth = 1.6
        projDescTextView.layer.borderColor = myColor.cgColor
        projDescTextView.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        projectTitle.layer.cornerRadius = 4
        courseTitle.layer.cornerRadius = 4
        projDescTextView.layer.cornerRadius = 4
        addProjectOutlet.layer.cornerRadius = 10
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields on LEFT
        projectTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: projectTitle.frame.height))
        projectTitle.leftViewMode = .always
        courseTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: courseTitle.frame.height))
        courseTitle.leftViewMode = .always
        
    }
    
    func TextViewProperties() {
        
        projDescTextView.backgroundColor = UIColor.white
        // padding for text view
        projDescTextView.textContainerInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 8)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        TextViewProperties()
        
    }
    
}   // #72
