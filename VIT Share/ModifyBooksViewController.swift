//
//  ModifyBooksViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ModifyBooksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // Delegate & Datasource for CollectionView & PickerView
    
    // Collection View
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    // Creating a List from Model
    var booksList = [BooksModel]()
    
    // Creating a Database Reference
    var refBooks: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Registering cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! Cell4
        
        // Adding target for edit button
        cell.editButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        // Adding target for delete button
        // cell.deleteButton.addTarget(self, action: #selector(deletePressed(sender:)), for: .touchUpInside)
        
        // Button sender.tag = Collection view indexPath.row
        cell.editButton.tag = indexPath.row
        // Button sender.tag = Collection view indexPath.row
        cell.deleteButton.tag = indexPath.row
        
        let book: BooksModel
        book = booksList[indexPath.row]
        cell.bookTitle2.text = book.title
        cell.bookDescription2.text = book.description
        cell.conditionValue2.text = book.condition
        cell.price2.text = book.price
        return cell
        
    }
    
    // Action for edit button
    @objc func buttonPressed(sender: UIButton) {
        
        sender.flash()
        // Collection view indexPath.row = Button sender.tag
        let book = booksList[sender.tag]
        // Alert
        let alertController = UIAlertController(title: "Modify Book", message: "", preferredStyle: .alert)
        
        // Add Textfields
        alertController.addTextField(configurationHandler: titleFunc(textField:))
        alertController.addTextField(configurationHandler: descriptionFunc(textField:))
        alertController.addTextField(configurationHandler: conditionFunc(textField:))
        alertController.addTextField(configurationHandler: priceFunc(textField:))
        
        // Update action
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            let id = book.id
            let newTitle = alertController.textFields?[0].text              // 1st textfield in Alert
            let newDescription = alertController.textFields?[1].text        // 2nd textfield in Alert
            let newCondition = alertController.textFields?[2].text          // 3rd textfield in Alert
            let newPrice = alertController.textFields?[3].text              // 4th textfield in Alert
            self.updateBook(id: id!, newTitle: newTitle!, newDescription: newDescription!, newCondition: newCondition!, newPrice: newPrice!)
        }
        
    }
    
    // Func for Title textfield
    func titleFunc(textField: UITextField!) {
        textField.tag = 0
        textField.inputView = pickerViewFrom
        textFieldRefFrom = textField        // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Description textfield
    func descriptionFunc(textField: UITextField!) {
        textField.tag = 1
        textField.inputView = pickerViewTo
        textFieldRefTo = textField          // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Condition textfield
    func conditionFunc(textField: UITextField!) {
        textField.tag = 2
        textField.keyboardType = .decimalPad
        textFieldRefSeats = textField       // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Price textfield
    func priceFunc(textField: UITextField!) {
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
    
    // Update Book func
    func updateBook(id: String, newTitle: String, newDescription: String, newCondition: String, newPrice: String) {
        let book = [
            "1) id": id,
            "2) Title": textFieldRefFrom.text!,
            "3) Description": textFieldRefTo.text!,
            "4) Condition": textFieldRefSeats.text!,
            "5) Price": textFieldRefDate.text!
        ]
        refBooks.child(id).setValue(book)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register CollectionViewCell 'Cell4' here
        cardCollectionView2.register(UINib.init(nibName: "Cell4", bundle: nil), forCellWithReuseIdentifier: "Cell4")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        
        // Referring it till "Details"
        refBooks = Database.database().reference().child("Books").child("Details")
        refBooks.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.booksList.removeAll()
                for books in snapshot.children.allObjects as! [DataSnapshot] {
                    let bookObject = books.value as? [String: AnyObject]    // Create an Object
                    let bookId = bookObject?["1) id"]
                    let bookTitle  = bookObject?["2) Title"]
                    let bookDescription  = bookObject?["3) Description"]
                    let bookCondition = bookObject?["4) Condition"]
                    let bookPrice = bookObject?["5) Price"]
                    
                    let book = BooksModel(id: bookId as! String?, title: bookTitle as! String?, description: bookDescription as! String?, condition: bookCondition as! String?, price: bookPrice as! String?, timestamp: nil)
                    self.booksList.append(book)
                }
                self.cardCollectionView2.reloadData()
                
            }
            
        })
        
    }

}   // #179
