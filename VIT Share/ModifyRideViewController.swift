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


    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    // Creating a List from Model
    var ridesList = [RidesModel]()
    
    // Creating a Reference
    var refRides: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ridesList.count
    }
    
    let pickerData = ["VIT Vellore", "VIT Chennai", "Chennai Airport", "Bangalore Airport", "Tirupati Airport", "Katpadi Railway Station", "Chennai Railway Station", "Bangalore Railway Station", "Tirupati Railway Station", "Pondicherry", "Kodaikanal"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    /* func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fromTF.text = pickerData[row]
        toTF.text = pickerData[row]
    } */
    
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
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    /* //////////////////////////////////////////////////////////////////////////////// */
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    // didSelectItemAt
    /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let ride = ridesList[indexPath.row]
        let alertController = UIAlertController(title: "Update", message: "Update Values", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: fromFunc(textField:))
        alertController.addTextField(configurationHandler: toFunc(textField:))
        alertController.addTextField(configurationHandler: seatsFunc(textField:))
        alertController.addTextField(configurationHandler: dateFunc(textField:))
        
        // Update action
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            let id = ride.id
            let newFrom = alertController.textFields?[0].text
            let newTo = alertController.textFields?[1].text
            let newSeats = alertController.textFields?[2].text
            let newDateTime = alertController.textFields?[3].text
            self.updateRide(id: id!, newFrom: newFrom!, newTo: newTo!, newSeats: newSeats!, newDateTime: newDateTime!)
        }
        
        // Adding Update action
        alertController.addAction(updateAction)
        
        // Present Alert controller
        present(alertController, animated: true, completion: nil)
        
    }
    
    func fromFunc(textField: UITextField!) {
        
        textField.tag = 0
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
        
    }
    
    
    func toFunc(textField: UITextField!) {
        
        textField.tag = 1
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
        
    }
    
    func seatsFunc(textField: UITextField!) {
        
        textField.tag = 2
        textField.keyboardType = .decimalPad
        
    }
    
    func dateFunc(textField: UITextField!) {
        
        textField.tag = 3
        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
        datePicker.datePickerMode = .dateAndTime
        
        // Formatter
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short    // Setting the format to 'short'
        formatter.timeStyle = .short    // Setting the format to 'short'
        
        textField.text = formatter.string(from: datePicker.date)
        textField.resignFirstResponder()
        self.view.endEditing(true)
        
    } */
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    /* //////////////////////////////////////////////////////////////////////////////// */
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    // didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let ride = ridesList[indexPath.row]
        let alertController = UIAlertController(title: "Update", message: "Update Values", preferredStyle: .alert)
        
        // Update action
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            let id = ride.id
            let newFrom = alertController.textFields?[0].text
            let newTo = alertController.textFields?[1].text
            let newSeats = alertController.textFields?[2].text
            let newDateTime = alertController.textFields?[3].text
            self.updateRide(id: id!, newFrom: newFrom!, newTo: newTo!, newSeats: newSeats!, newDateTime: newDateTime!)
        }
        
        // Picker view
        let pickerView = UIPickerView()
        alertController.view.addSubview(pickerView) // Adding picker view to the alert controller view
        pickerView.delegate = self                  // Set delegate
        pickerView.dataSource = self                // Set datasource
        
        // Date and Time picker
        let datePicker = UIDatePicker()
        
        // Toolbar, upon Picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Bar button, in Toolbar
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolbar.setItems([doneBtn], animated: true)
        
        // #1
        alertController.addTextField{(textField) in
            textField.text = ride.from
            textField.inputView = pickerView
            
            // Assign toolbar to the keyboard
            textField.inputAccessoryView = toolbar
        }
        
        // #2
        alertController.addTextField{(textField) in
            textField.text = ride.to
            textField.inputView = pickerView
            
            // Assign toolbar to the keyboard
            textField.inputAccessoryView = toolbar
        }
        
        // #3
        alertController.addTextField{(textField) in
            textField.text = ride.seats
            textField.keyboardType = .decimalPad
        }
        
        // #4
        alertController.addTextField{(textField) in
            // textField.text = ride.dateTime
            textField.inputView = datePicker
            
            // Assign toolbar to the keyboard
            textField.inputAccessoryView = toolbar
            
            // Assign date picker to the textfield
            textField.inputView = datePicker
            
            // Date picker mode
            datePicker.datePickerMode = .dateAndTime
            
            // Formatter
            let formatter = DateFormatter()
            formatter.dateStyle = .short    // Setting the format to 'short'
            formatter.timeStyle = .short    // Setting the format to 'short'
            
            textField.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
            
        }
        
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
    
    
    // Update Ride func
    func updateRide(id: String, newFrom: String, newTo: String, newSeats: String, newDateTime: String) {
        
        let ride = [
            "id": id,
            "From": newFrom,
            "To": newTo,
            "Seats": newSeats,
            "Date": newDateTime
        ]
        refRides.child(id).setValue(ride)
        
    }
    
    /*
    // Picker view
    let pickerView = UIPickerView()
    // alertController.view.addSubview(pickerView) // Adding picker view to the alert controller view
    
    // Date and Time picker
    let datePicker = UIDatePicker()
    
    // Toolbar, upon Picker
    let toolbar = UIToolbar()
    
    // Bar button, in Toolbar
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(DonePressed))
    
    @objc func DonePressed() {
        
        // Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .short    // Setting the format to 'short'
        formatter.timeStyle = .short    // Setting the format to 'short'
        
        dateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    */
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        pickerView.delegate = self                  // Set delegate
        pickerView.dataSource = self                // Set datasource
        
        toolbar.sizeToFit()
        toolbar.setItems([doneBtn], animated: true)
        */
        
        // Register CollectionViewCell 'Cell2' here
        cardCollectionView2.register(UINib.init(nibName: "Cell2", bundle: nil), forCellWithReuseIdentifier: "Cell2")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
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
    /* //////////////////////////////////////////////////////////////////////////////// */
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
    
}   // #458
