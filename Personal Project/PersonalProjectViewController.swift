//
//  PersonalProjectViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
// import FirebaseDatabase

class PersonalProjectViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var projectTitle: UITextField!
    @IBOutlet var roleOption: DropDown!
    @IBOutlet var projDescTextView: UITextView!
    @IBOutlet var addProjectOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield/Textview Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        // let dropdownColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0)
        projectTitle.layer.borderColor = myColor.cgColor
        projectTitle.layer.borderWidth = 1.0
        roleOption.layer.borderColor = myColor.cgColor
        roleOption.layer.borderWidth = 1.6
        projDescTextView.layer.borderColor = myColor.cgColor
        projDescTextView.layer.borderWidth = 1.0
        
    }
    
    func CornerRadius() {
        
        // Textfield/Textview Corner Radius Property
        projectTitle.layer.cornerRadius = 4
        roleOption.layer.cornerRadius = 22
        projDescTextView.layer.cornerRadius = 4
        addProjectOutlet.layer.cornerRadius = 10
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields on LEFT
        projectTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: projectTitle.frame.height))
        projectTitle.leftViewMode = .always
        roleOption.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: roleOption.frame.height))
        roleOption.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For TextField
        roleOption.optionArray = ["iOS developer", "Android developer", "Web developer", "Backend developer", "UI-UX designer", "Content writer", "Media partner"]
        roleOption.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
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
        DropDownOptions()
        TextViewProperties()
        
    }
    
    // Submit button action
    @IBAction func addProjectTapped(_ sender: UIButton) {
        
        sender.flash()
        
        if (projectTitle.text!.isEmpty || roleOption.text!.isEmpty || projDescTextView.text!.isEmpty) {
            // Alert for empty fields
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        HelperServicePP.uploadDataToServer(titleText: projectTitle.text!, roleText: roleOption.text!, descText: projDescTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines), onSuccess: {
            // Alert pod - Project Added
            let alertView = SPAlertView(title: "Your project has been added", message: nil, preset: SPAlertPreset.done)
            alertView.duration = 1.2
            alertView.present()
            
            // Clear textfields after success
            self.projectTitle.text = ""
            self.roleOption.text = ""
            self.projDescTextView.text = ""
            
            // And to enable back for a new input in textfield
            self.projectTitle.isEnabled = true
            self.roleOption.isEnabled = true
            // self.projDescTextView.isEnabled = true
        })
        
    }
    
}   // #118
