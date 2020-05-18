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
        
        // 1
        let radioButton1 = LTHRadioButton(selectedColor: .systemBlue)
        view.addSubview(radioButton1)

        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          radioButton1.topAnchor.constraint(equalTo: view.topAnchor, constant: 264),
          radioButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          radioButton1.heightAnchor.constraint(equalToConstant: radioButton1.frame.height),
          radioButton1.widthAnchor.constraint(equalToConstant: radioButton1.frame.width)]
        )

        radioButton1.onSelect {
          print("Radio-1 selected.")
        }

        radioButton1.onDeselect {
          print("Radio-1 deselected.")
        }

        radioButton1.select() // I'm selected.
        radioButton1.deselect(animated: false) // I'm deselected.
        
        let radioButton2 = LTHRadioButton(selectedColor: .systemBlue)
        view.addSubview(radioButton2)
        
        // 2
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          radioButton2.topAnchor.constraint(equalTo: view.topAnchor, constant: 264),
          radioButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
          radioButton2.heightAnchor.constraint(equalToConstant: radioButton2.frame.height),
          radioButton2.widthAnchor.constraint(equalToConstant: radioButton2.frame.width)]
        )

        radioButton2.onSelect {
          print("Radio-2 selected.")
        }

        radioButton2.onDeselect {
          print("Radio-2 deselected.")
        }

        radioButton2.select() // I'm selected.
        radioButton2.deselect(animated: false) // I'm deselected.

        hideKeyboardWhenTappedAround()
        BorderProp()
        CornerRadius()
        LeftPadding()
        
    }

}   // #104
