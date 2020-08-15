//
//  PersonalProjectViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PersonalProjectViewController: UIViewController {
    
    // Outlets
    @IBOutlet var projectTitle: UITextField!
    @IBOutlet var roleOption: DropDown!
    @IBOutlet var projDescTextView: UITextView!
    @IBOutlet var addProjectOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        // let dropdownColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0)
        projectTitle.layer.borderColor = myColor.cgColor
        projectTitle.layer.borderWidth = 1.6
        roleOption.layer.borderColor = myColor.cgColor
        roleOption.layer.borderWidth = 1.6
        projDescTextView.layer.borderColor = myColor.cgColor
        projDescTextView.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
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
    
    // Create a DB reference
    var refPersProjPosts: DatabaseReference!
    
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
        
        // Writing data to DB
        refPersProjPosts = Database.database().reference().child("Personal Projects").child("Details")
        let key = refPersProjPosts.childByAutoId().key
        
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        
        // Current user uid
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let currentUserId = currentUser.uid
        
        let project = ["1) id": key!, "2) Title": projectTitle.text!, "3) Role": roleOption.text!, "4) Description": projDescTextView.text!, "5) Timestamp": timestamp, "6) uid": currentUserId] as [String : Any]
        refPersProjPosts.child(key!).setValue(project)
        
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
        
    }
    
}   // #134
