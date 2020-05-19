//
//  PostViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostViewController: UIViewController {
    
    // Outlets
    @IBOutlet var bookTitle: UITextField!
    @IBOutlet var bookDescription: UITextField!
    @IBOutlet var bookPrice: UITextField!
    @IBOutlet var submitOutlet: UIButton!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
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
        submitOutlet.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        bookTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: bookTitle.frame.height))
        bookTitle.leftViewMode = .always
        bookDescription.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: bookDescription.frame.height))
        bookDescription.leftViewMode = .always
        
    }
    
    // #1
    let radioButton1 = LTHRadioButton(selectedColor: .systemBlue)
    
    // #2
    let radioButton2 = LTHRadioButton(selectedColor: .systemBlue)
    
    // #3
    let radioButton3 = LTHRadioButton(selectedColor: .systemBlue)
    
    func RadioButton() {
        
        // #1
        view.addSubview(radioButton1)
        
        // #2
        view.addSubview(radioButton2)
        
        // #3
        view.addSubview(radioButton3)
        
        // #1
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          radioButton1.topAnchor.constraint(equalTo: view.topAnchor, constant: 264),
          radioButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          radioButton1.heightAnchor.constraint(equalToConstant: radioButton1.frame.height),
          radioButton1.widthAnchor.constraint(equalToConstant: radioButton1.frame.width)]
        )

        radioButton1.onSelect {
            print("Radio-1 selected.")
            self.radioButton2.deselect()
            self.radioButton3.deselect()
        }

        radioButton1.onDeselect {
            print("Radios deselected.")
        }

        radioButton1.select() // I'm selected.
        radioButton1.deselect(animated: false) // I'm deselected.
        
        // #2
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          radioButton2.topAnchor.constraint(equalTo: view.topAnchor, constant: 264),
          radioButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180),
          radioButton2.heightAnchor.constraint(equalToConstant: radioButton2.frame.height),
          radioButton2.widthAnchor.constraint(equalToConstant: radioButton2.frame.width)]
        )

        radioButton2.onSelect {
            print("Radio-2 selected.")
            self.radioButton1.deselect()
            self.radioButton3.deselect()
        }

        radioButton2.onDeselect {
            print("Radios deselected.")
        }

        radioButton2.select() // I'm selected.
        radioButton2.deselect(animated: false) // I'm deselected.
        
        // #3
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          radioButton3.topAnchor.constraint(equalTo: view.topAnchor, constant: 304),
          radioButton3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          radioButton3.heightAnchor.constraint(equalToConstant: radioButton3.frame.height),
          radioButton3.widthAnchor.constraint(equalToConstant: radioButton3.frame.width)]
        )

        radioButton3.onSelect {
            print("Radio-3 selected.")
            self.radioButton1.deselect()
            self.radioButton2.deselect()
        }

        radioButton3.onDeselect {
            print("Radios deselected.")
        }

        radioButton3.select() // I'm selected.
        radioButton3.deselect(animated: false) // I'm deselected.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        RadioButton()
        
    }
    
    // Create a DB reference
    var refBooks: DatabaseReference!
    
    // Submit button action
    @IBAction func submitTapped(_ sender: UIButton) {
        
        if (bookTitle.text!.isEmpty || bookDescription.text!.isEmpty || bookPrice.text!.isEmpty || (radioButton1.isSelected == false && radioButton2.isSelected == false && radioButton3.isSelected == false) ) {
            // Alert
            let myAlert = UIAlertController(title: "Empty Fields", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        // Writing data to DB
        refBooks = Database.database().reference().child("Books").child("Details")
        let key = refBooks.childByAutoId().key
        
        let book1ForLabel1 = ["1) id": key, "2) Title": bookTitle.text!, "3) Description": bookDescription.text!, "4) Condition": label1.text!, "5) Price": bookPrice.text!]
        let book2ForLabel2 = ["1) id": key, "2) Title": bookTitle.text!, "3) Description": bookDescription.text!, "4) Condition": label2.text!, "5) Price": bookPrice.text!]
        let book3ForLabel3 = ["1) id": key, "2) Title": bookTitle.text!, "3) Description": bookDescription.text!, "4) Condition": label3.text!, "5) Price": bookPrice.text!]
        
        if radioButton1.isSelected == true {
            refBooks.child(key!).setValue(book1ForLabel1)
        }
        if radioButton2.isSelected == true {
            refBooks.child(key!).setValue(book2ForLabel2)
        }
        if radioButton3.isSelected == true {
            refBooks.child(key!).setValue(book3ForLabel3)
        }
        
        // Clear textfields after submit tapped
        self.bookTitle.text = ""
        self.bookDescription.text = ""
        self.bookPrice.text = ""
        
        // Deselect radio buttons after submit tapped
        radioButton1.deselect()
        radioButton2.deselect()
        radioButton3.deselect()
        
        // And to enable back for a new input in textfield
        self.bookTitle.isEnabled = true
        self.bookDescription.isEnabled = true
        self.bookPrice.isEnabled = true
        
    }

}   // #204
