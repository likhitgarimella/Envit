//
//  JComponentViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
// import FirebaseDatabase

class JComponentViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var projectTitle: UITextField!
    @IBOutlet var courseTitle: UITextField!
    @IBOutlet var projDescTextView: UITextView!
    @IBOutlet var addProjectOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield/Textview Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        projectTitle.layer.borderColor = myColor.cgColor
        projectTitle.layer.borderWidth = 1.0
        courseTitle.layer.borderColor = myColor.cgColor
        courseTitle.layer.borderWidth = 1.6
        projDescTextView.layer.borderColor = myColor.cgColor
        projDescTextView.layer.borderWidth = 1.0
        
    }
    
    func CornerRadius() {
        
        // Textfield/Textview Corner Radius Property
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
    
    // Submit button action
    @IBAction func addProjectTapped(_ sender: UIButton) {
        
        sender.flash()
        
        if (projectTitle.text!.isEmpty || courseTitle.text!.isEmpty || projDescTextView.text!.isEmpty) {
            // Alert for empty fields
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        HelperServiceJC.uploadDataToServer(titleText: projectTitle.text!, courseText: courseTitle.text!, descText: projDescTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines), onSuccess: {
            // Alert pod - Project Added
            let alertView = SPAlertView(title: "Your project has been added", message: nil, preset: SPAlertPreset.done)
            alertView.duration = 1.2
            alertView.present()
            
            // Clear textfields after success
            self.projectTitle.text = ""
            self.courseTitle.text = ""
            self.projDescTextView.text = ""
            
            // And to enable back for a new input in textfield
            self.projectTitle.isEnabled = true
            self.courseTitle.isEnabled = true
            // self.projDescTextView.isEnabled = true
        })
        
    }
    
}   // #108
