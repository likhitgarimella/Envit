//
//  PostViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {
    
    // Outlets
    @IBOutlet var bookTitle: UITextField!
    @IBOutlet var bookDescription: UITextField!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        bookTitle.layer.borderColor = myColor.cgColor
        bookTitle.layer.borderWidth = 1.6
        bookDescription.layer.borderColor = myColor.cgColor
        bookDescription.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        bookTitle.layer.cornerRadius = 4
        bookDescription.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        bookTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: bookTitle.frame.height))
        bookTitle.leftViewMode = .always
        bookDescription.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: bookDescription.frame.height))
        bookDescription.leftViewMode = .always
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        
    }

}   // #58
