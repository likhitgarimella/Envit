//
//  MentorViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController, UITextViewDelegate {
    
    // Outlets
    @IBOutlet var domain: DropDown!
    @IBOutlet var experienceTextView: UITextView!
    @IBOutlet var prerequisites: UITextField!
    @IBOutlet var courses: UITextField!
    @IBOutlet var submitOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        domain.layer.borderColor = myColor.cgColor
        domain.layer.borderWidth = 1.6
        experienceTextView.layer.borderColor = myColor.cgColor
        experienceTextView.layer.borderWidth = 1.6
        prerequisites.layer.borderColor = myColor.cgColor
        prerequisites.layer.borderWidth = 1.6
        courses.layer.borderColor = myColor.cgColor
        courses.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        domain.layer.cornerRadius = 4
        experienceTextView.layer.cornerRadius = 4
        prerequisites.layer.cornerRadius = 4
        courses.layer.cornerRadius = 4
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        domain.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: domain.frame.height))
        domain.leftViewMode = .always
        prerequisites.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: prerequisites.frame.height))
        prerequisites.leftViewMode = .always
        courses.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: courses.frame.height))
        courses.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For Credits TextFields
        domain.optionArray = ["iOS App Development", "Android App Development", "Web Development", "Node.js", "Machine Learning", "Flutter", "React Native", "Design"]
        domain.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }
    
    func Properties() {
        
        experienceTextView.backgroundColor = UIColor.white
        // padding for text view
        experienceTextView.textContainerInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 8)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        Properties()
        
    }

}   // #88
