//
//  MenteeViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenteeViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var domain: DropDown!
    @IBOutlet var postQueryTextView: UITextView!
    @IBOutlet var submitOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield/Textview Border Property
        let myColor = UIColor.systemGray
        domain.layer.borderColor = myColor.cgColor
        domain.layer.borderWidth = 1.6
        postQueryTextView.layer.borderColor = myColor.cgColor
        postQueryTextView.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield/Textview Corner Radius Property
        domain.layer.cornerRadius = 4
        postQueryTextView.layer.cornerRadius = 4
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields/Textviews on LEFT
        domain.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: domain.frame.height))
        domain.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For Credits TextFields
        domain.optionArray = ["iOS", "Android", "Web", "Node.js", "ML", "Flutter", "React", "Design"]
        domain.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }
    
    func TextViewProperties() {
        
        postQueryTextView.backgroundColor = UIColor.white
        // padding for text view
        postQueryTextView.textContainerInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 8)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        TextViewProperties()
        
    }
    
}   // #78
