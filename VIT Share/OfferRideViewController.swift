//
//  OfferRideViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class OfferRideViewController: UIViewController {

    // Outlets
    @IBOutlet var fromLoc: DropDown!
    @IBOutlet var toLoc: DropDown!
    @IBOutlet var stepperValue: UILabel!
    @IBOutlet var stepperOutlet: UIStepper!
    @IBOutlet var date: UITextField!
    @IBOutlet var submitOutlet: UIButton!
    
    @IBAction func stepper(_ sender: UIStepper) {
        stepperValue.text = String(Int(sender.value))
    }
    
    let datePicker = UIDatePicker()
    
    func CreateDatePicker() {
        
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(DonePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        // Assign toolbar to the keyboard
        date.inputAccessoryView = toolbar
        
        // Assign date picker to the textfield
        date.inputView = datePicker
        
        // Date picker mode
        datePicker.datePickerMode = .dateAndTime
        
    }
    
    @objc func DonePressed() {
        
        // Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .short    // Setting the format to 'short'
        formatter.timeStyle = .short    // Setting the format to 'short'
        
        date.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        fromLoc.layer.borderColor = myColor.cgColor
        fromLoc.layer.borderWidth = 1.6
        toLoc.layer.borderColor = myColor.cgColor
        toLoc.layer.borderWidth = 1.6
        stepperOutlet.layer.borderColor = myColor.cgColor
        stepperOutlet.layer.borderWidth = 1.6
        date.layer.borderColor = myColor.cgColor
        date.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        fromLoc.layer.cornerRadius = 4
        toLoc.layer.cornerRadius = 4
        stepperOutlet.layer.cornerRadius = 4
        date.layer.cornerRadius = 4
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        fromLoc.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: fromLoc.frame.height))
        fromLoc.leftViewMode = .always
        toLoc.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: toLoc.frame.height))
        toLoc.leftViewMode = .always
        date.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: date.frame.height))
        date.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For Credits TextFields
        fromLoc.optionArray = ["VIT Vellore", "VIT Chennai", "Chennai Airport", "Bangalore Airport", "Tirupati Airport", "Katpadi Railway Station", "Chennai Railway Station", "Bangalore Railway Station", "Tirupati Railway Station", "Pondicherry", "Kodaikanal"]
        fromLoc.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        toLoc.optionArray = ["VIT Vellore", "VIT Chennai", "Chennai Airport", "Bangalore Airport", "Tirupati Airport", "Katpadi Railway Station", "Chennai Railway Station", "Bangalore Railway Station", "Tirupati Railway Station", "Pondicherry", "Kodaikanal"]
        toLoc.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        CreateDatePicker()
        
    }
    
    // Create a DB reference
    var refRides: DatabaseReference!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        
        if (fromLoc.text!.isEmpty || toLoc.text!.isEmpty || stepperValue.text!.isEmpty || date.text!.isEmpty) {
            // Alert
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        // Writing data to DB
        refRides = Database.database().reference().child("Rides").child("Details")
        let key = refRides.childByAutoId().key
        let ride = ["id": key, "From": fromLoc.text!, "To": toLoc.text!, "Seats": stepperValue.text!, "Date": date.text!]
        refRides.child(key!).setValue(ride)
        
        // Clear textfields after success
        self.fromLoc.text = ""
        self.toLoc.text = ""
        self.stepperValue.text = "0"
        self.date.text = ""
        
        //And to enable back for a new input in textfield
        self.fromLoc.isEnabled = true
        self.toLoc.isEnabled = true
        self.stepperValue.isEnabled = true
        self.date.isEnabled = true
        
    }
    
}   // #156
