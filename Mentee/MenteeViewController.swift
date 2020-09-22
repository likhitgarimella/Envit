//
//  MenteeViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
// import FirebaseDatabase

class MenteeViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var beMentee: UIButton!
    @IBOutlet var domain: DropDown!
    @IBOutlet var postQueryTextView: UITextView!
    @IBOutlet var submitOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield/Textview Border Property
        let myColor = UIColor(red: 63/255, green: 85/255, blue: 132/255, alpha: 1.0)
        // let dropdownColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0)
        domain.layer.borderColor = myColor.cgColor
        domain.layer.borderWidth = 1.6
        postQueryTextView.layer.borderColor = myColor.cgColor
        postQueryTextView.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield/Textview Corner Radius Property
        beMentee.layer.cornerRadius = 15
        domain.layer.cornerRadius = 22
        postQueryTextView.layer.cornerRadius = 4
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields on LEFT
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
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        TextViewProperties()
        
    }
    
    // Submit button action
    @IBAction func submitTapped(_ sender: UIButton) {
        
        sender.flash()
        
        if (domain.text!.isEmpty || postQueryTextView.text!.isEmpty) {
            // Alert for empty fields
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        /*
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        
        // Current user uid
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let currentUserId = currentUser.uid
        */
        
        HelperServiceMentee.uploadDataToServer(domainText: domain.text!, queryText: postQueryTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines), onSuccess: {
            // Alert pod - Query Added
            let alertView = SPAlertView(title: "Your query has been posted", message: nil, preset: SPAlertPreset.done)
            alertView.duration = 1.2
            alertView.present()
            
            // Clear textfields after success
            self.domain.text = ""
            self.postQueryTextView.text = ""
            
            // And to enable back for a new input in textfield
            self.domain.isEnabled = true
            // self.experienceTextView.isEnabled = true
        })
        
    }
    
}   // #126
