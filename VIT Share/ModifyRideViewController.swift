//
//  ModifyRideViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SkeletonView

class ModifyRideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    // Delegate & Datasource for CollectionView & PickerView

    /* //////////////////////////////////////////////////////////////////////////////// */
    
    // Collection View
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    // Creating a List from Model
    var ridesList = [RidesModel]()
    
    // Creating a Database Reference
    var refRides: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ridesList.count
    }
    
    
    // Array for 1st picker
    var pickerDataFrom = ["VIT Vellore", "VIT Chennai", "Chennai Airport", "Bangalore Airport", "Tirupati Airport", "Katpadi Railway Station", "Chennai Railway Station", "Bangalore Railway Station", "Tirupati Railway Station", "Pondicherry", "Kodaikanal"]
    
    // Array for 2nd picker
    var pickerDataTo = ["VIT Vellore", "VIT Chennai", "Chennai Airport", "Bangalore Airport", "Tirupati Airport", "Katpadi Railway Station", "Chennai Railway Station", "Bangalore Railway Station", "Tirupati Railway Station", "Pondicherry", "Kodaikanal"]
    
    
    // numberOfComponents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numberOfRowsInComponent
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataFrom.count
    }
    
    // titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataFrom[row]
    }
    
    // didSelectRow
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickerViewFrom) {
            textFieldRefFrom.text = pickerDataFrom[row]
        }
        if (pickerView == pickerViewTo) {
            textFieldRefTo.text = pickerDataTo[row]
        }
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! Cell2
        if ridesList != nil {
            cell.hideAnimation()
            let ride: RidesModel
            ride = ridesList[indexPath.row]
            cell.fromPlace2.text = ride.from
            cell.toPlace2.text = ride.to
            cell.noOfSeatsValue2.text = ride.seats
            cell.dateAndTime2.text = ride.dateTime
        }
        return cell
    }
    
    var textFieldRefFrom: UITextField!      // Textfield for From in Alert
    var textFieldRefTo: UITextField!        // Textfield for To in Alert
    var textFieldRefSeats: UITextField!     // Textfield for Seats in Alert
    var textFieldRefDate: UITextField!      // Textfield for Date&Time in Alert
    
    // Picker view
    var pickerViewFrom = UIPickerView()
    var pickerViewTo = UIPickerView()
    
    // Date and Time picker
    var datePicker = UIDatePicker()
    
    // Toolbar, upon Picker
    let toolbar = UIToolbar()
    
    // didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // indexPath.row
        let ride = ridesList[indexPath.row]
        // Alert
        let alertController = UIAlertController(title: "Modify Ride", message: "", preferredStyle: .alert)
        
        // Add Textfields
        alertController.addTextField(configurationHandler: fromFunc(textField:))
        alertController.addTextField(configurationHandler: toFunc(textField:))
        alertController.addTextField(configurationHandler: seatsFunc(textField:))
        alertController.addTextField(configurationHandler: dateFunc(textField:))
        
        // Update action
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            let id = ride.id
            let newFrom = alertController.textFields?[0].text       // 1st textfield in Alert
            let newTo = alertController.textFields?[1].text         // 2nd textfield in Alert
            let newSeats = alertController.textFields?[2].text      // 3rd textfield in Alert
            let newDateTime = alertController.textFields?[3].text   // 4th textfield in Alert
            self.updateRide(id: id!, newFrom: newFrom!, newTo: newTo!, newSeats: newSeats!, newDateTime: newDateTime!)
        }
        
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 22.0)!]
        // let messageFont = [NSAttributedString.Key.font: UIFont(name: "Avenir-Roman", size: 18.0)!]
        
        let titleAttrString = NSMutableAttributedString(string: "Modify Ride", attributes: titleFont)
        // let messageAttrString = NSMutableAttributedString(string: "Message Here", attributes: messageFont)

        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        // alertController.setValue(messageAttrString, forKey: "attributedMessage")
        
        // Assigning old data from 'ride' to alert's textfields when Alert loads up
        alertController.textFields?[0].text = ride.from
        alertController.textFields?[1].text = ride.to
        alertController.textFields?[2].text = ride.seats
        alertController.textFields?[3].text = ride.dateTime
        
        // Delete action
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
            
        }
        
        // Adding Update action
        alertController.addAction(updateAction)
        
        // Adding Delete action
        alertController.addAction(deleteAction)
        
        // Present Alert controller
        present(alertController, animated: true, completion: nil)
        
    }
    
    // Func for From textfield
    func fromFunc(textField: UITextField!) {
        textField.tag = 0
        textField.inputView = pickerViewFrom
        textFieldRefFrom = textField        // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for To textfield
    func toFunc(textField: UITextField!) {
        textField.tag = 1
        textField.inputView = pickerViewTo
        textFieldRefTo = textField          // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Seats textfield
    func seatsFunc(textField: UITextField!) {
        textField.tag = 2
        textField.keyboardType = .decimalPad
        textFieldRefSeats = textField       // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Date textfield
    func dateFunc(textField: UITextField!) {
        textField.tag = 3
        textField.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
        textFieldRefDate = textField        // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        onDatePickerStart(sender: datePicker)
        
        // Done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePicker))
        // Set done button to toolbar
        toolbar.setItems([doneButton], animated: false)
        // Adding toolbar to picker
        textField.inputAccessoryView = toolbar
    }
    
    func onDatePickerStart(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        // textFieldRef.text = formatter.string(from: datePicker.date)
        // Commented this ⬆️ line bcuz, this gives instant current text into the textfield,
        // without even selecting a value from datePicker.
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        textFieldRefDate.text = formatter.string(from: datePicker.date)
    }
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        textFieldRefDate.text = formatter.string(from: datePicker.date)
        textFieldRefDate.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    // Update button
    @IBAction func updateButton(_ sender: UIButton) {
        
        AnimateOut(desiredView: popUpView)  // This First
        AnimateOut(desiredView: blurView)   // This Next
        
    }

    // Update Ride func
    func updateRide(id: String, newFrom: String, newTo: String, newSeats: String, newDateTime: String) {
        
        let ride = [
            "id": id,
            "From": textFieldRefFrom.text!,
            "To": textFieldRefTo.text!,
            "Seats": textFieldRefSeats.text!,
            "Date": textFieldRefDate.text!
        ]
        refRides.child(id).setValue(ride)
        
    }
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CollectionViewCell 'Cell2' here
        cardCollectionView2.register(UINib.init(nibName: "Cell2", bundle: nil), forCellWithReuseIdentifier: "Cell2")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        // 1st picker view
        pickerViewFrom.delegate = self                  // Set delegate
        pickerViewFrom.dataSource = self                // Set datasource
        
        // 2nd picker view
        pickerViewTo.delegate = self                  // Set delegate
        pickerViewTo.dataSource = self                // Set datasource
        
        // Toolbar properties
        toolbar.sizeToFit()
        
        hideKeyboardWhenTappedAround()
        
        // Referring it till "Details"
        refRides = Database.database().reference().child("Rides").child("Details")
        refRides.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.ridesList.removeAll()
                for rides in snapshot.children.allObjects as! [DataSnapshot] {
                    let rideObject = rides.value as? [String: AnyObject]    // Create an Object
                    let rideId = rideObject?["id"]
                    let rideFrom  = rideObject?["From"]
                    let rideTo  = rideObject?["To"]
                    let rideSeats = rideObject?["Seats"]
                    let rideDateTime = rideObject?["Date"]
                    
                    let ride = RidesModel(id: rideId as! String?, from: rideFrom as! String?, to: rideTo as! String?, seats: rideSeats as! String?, dateTime: rideDateTime as! String?)
                    self.ridesList.append(ride)
                }
                self.cardCollectionView2.reloadData()
                
            }
            
        })
        
        // PopUp UIView Properties
        PopUpProp()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        
    }
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    // PopUp Animation
    func PopUpAnimation() {
        
        blurView.bounds = self.view.bounds
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.68, height: self.view.bounds.height*0.54)
        
    }
    
    // Animate in a specified view
    func AnimateIn(desiredView: UIView) {
        
        let backgroundView = self.view!
        
        // Attach our desired view to the screen
        backgroundView.addSubview(desiredView)
        
        // Sets the view's scaling to be 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        // Animate from here ⬆️
        
        // To here ⬇️
        // Animate the effect
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
        
    }
    
    // Animate out a specified view
    func AnimateOut(desiredView: UIView) {
        
       UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
       }, completion: { _ in
        // This code runs when when above AnimateOut animation is done
        desiredView.removeFromSuperview()
       })
        
    }
    
    // Popup view outlets
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBOutlet var popUpView: UIView!
    
    @IBOutlet var fromTF: UITextField!
    
    @IBOutlet var toTF: UITextField!
    
    @IBOutlet var seatsTF: UITextField!
    
    @IBOutlet var dateTF: UITextField!
    
    @IBOutlet var updateOutlet: UIButton!
    
    // PopUp UIView Properties
    func PopUpProp() {
        
        popUpView.layer.cornerRadius = 16
        
    }
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        fromTF.layer.borderColor = myColor.cgColor
        fromTF.layer.borderWidth = 1.6
        toTF.layer.borderColor = myColor.cgColor
        toTF.layer.borderWidth = 1.6
        seatsTF.layer.borderColor = myColor.cgColor
        seatsTF.layer.borderWidth = 1.6
        dateTF.layer.borderColor = myColor.cgColor
        dateTF.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        fromTF.layer.cornerRadius = 4
        toTF.layer.cornerRadius = 4
        seatsTF.layer.cornerRadius = 4
        dateTF.layer.cornerRadius = 4
        updateOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        fromTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: fromTF.frame.height))
        fromTF.leftViewMode = .always
        toTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: toTF.frame.height))
        toTF.leftViewMode = .always
        seatsTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: seatsTF.frame.height))
        seatsTF.leftViewMode = .always
        dateTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: dateTF.frame.height))
        dateTF.leftViewMode = .always
        
    }
    
}   // #412
