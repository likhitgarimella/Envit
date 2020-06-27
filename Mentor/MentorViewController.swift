//
//  MentorViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MentorViewController: UIViewController, UITextViewDelegate {
    
    // Outlets
    @IBOutlet var domain: DropDown!
    @IBOutlet var experienceTextView: UITextView!
    @IBOutlet var prerequisites: UITextField!
    @IBOutlet var courses: UITextField!
    @IBOutlet var submitOutlet: UIButton!
    
    func BorderProp() {
        
        // Textfield/Textview Border Property
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
        
        // Textfield/Textview Corner Radius Property
        domain.layer.cornerRadius = 4
        experienceTextView.layer.cornerRadius = 4
        prerequisites.layer.cornerRadius = 4
        courses.layer.cornerRadius = 4
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields/Textviews on LEFT
        domain.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: domain.frame.height))
        domain.leftViewMode = .always
        prerequisites.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: prerequisites.frame.height))
        prerequisites.leftViewMode = .always
        courses.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: courses.frame.height))
        courses.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For TextField
        domain.optionArray = ["iOS", "Android", "Web", "Node.js", "ML", "Flutter", "React", "Design"]
        domain.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }
    
    func TextViewProperties() {
        
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
        TextViewProperties()
        
    }
    
    // Create a DB reference
    var refMentors: DatabaseReference!
    
    // Submit button action
    @IBAction func submitTapped(_ sender: UIButton) {
        
        if (domain.text!.isEmpty || experienceTextView.text!.isEmpty) {
            // Alert for empty fields
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        // Writing data to DB
        refMentors = Database.database().reference().child("Mentors").child("Details")
        let key = refMentors.childByAutoId().key
        
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        
        // Current user uid
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let currentUserId = currentUser.uid
        
        let mentor = ["1) id": key!, "2) Domain": domain.text!, "3) Experience": experienceTextView.text!, "4) Prerequisites": prerequisites.text!, "5) Courses": courses.text!, "6) Timestamp": timestamp, "7) uid": currentUserId] as [String : Any]
        refMentors.child(key!).setValue(mentor)
        
        // Alert pod - Work Added
        let alertView = SPAlertView(title: "Your work has been added", message: nil, preset: SPAlertPreset.done)
        alertView.duration = 1.2
        alertView.present()
        
        // Clear textfields after success
        self.domain.text = ""
        self.experienceTextView.text = ""
        self.prerequisites.text = ""
        self.courses.text = ""
        
        // And to enable back for a new input in textfield
        self.domain.isEnabled = true
        // self.experienceTextView.isEnabled = true
        self.prerequisites.isEnabled = true
        self.courses.isEnabled = true
        
    }

}   // #140
