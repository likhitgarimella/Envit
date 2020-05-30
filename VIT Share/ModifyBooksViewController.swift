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

class ModifyBooksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    // Delegate & Datasource for CollectionView & PickerView
    
    // Collection View
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    @IBOutlet var activityIndicatorView4: UIActivityIndicatorView!
    
    // Creating a List from Model
    var booksList = [BooksModel]()
    
    // Creating a Database Reference
    var refBooks: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList.count
    }
    
    // Picker view
    var pickerBooksCondition = UIPickerView()
    
    // Array for books condition picker
    var pickerDataBooksCondition = ["New/Unused", "Good/Used", "Collectible"]
    
    // numberOfComponents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numberOfRowsInComponent
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataBooksCondition.count
    }
    
    // titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataBooksCondition[row]
    }
    
    // didSelectRow
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldRefCondition.text = pickerDataBooksCondition[row]
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Registering cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! Cell4
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        // Adding target for edit button
        cell.editButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        // Adding target for delete button
        cell.deleteButton.addTarget(self, action: #selector(deletePressed(sender:)), for: .touchUpInside)
        
        // Button sender.tag = Collection view indexPath.row
        cell.editButton.tag = indexPath.row
        // Button sender.tag = Collection view indexPath.row
        cell.deleteButton.tag = indexPath.row
        
        let book: BooksModel
        book = booksList[indexPath.row]
        cell.bookTitle2.text = book.title
        cell.bookDescription2.text = book.description
        cell.conditionValue2.text = book.condition
        cell.price2.text = String(book.price!)
        
        if let seconds = book.timestamp {
            // let timeStampDate = NSDate(timeIntervalSince1970: seconds)
            let pastDate = Date(timeIntervalSince1970: seconds)
            // let dateFormatter = DateFormatter()
            // dateFormatter.dateFormat = "MMM d, h:mm a"
            // cell.timeAgo.text = dateFormatter.string(from: timeStampDate as Date)
            cell.timeAgo2.text = pastDate.timeAgoDisplay()
        }
        
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
        
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 22.0)!]
        // let messageFont = [NSAttributedString.Key.font: UIFont(name: "Avenir-Roman", size: 18.0)!]
        
        let titleAttrString = NSMutableAttributedString(string: "Modify Book", attributes: titleFont)
        // let messageAttrString = NSMutableAttributedString(string: "Message Here", attributes: messageFont)

        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        // alertController.setValue(messageAttrString, forKey: "attributedMessage")
        
        // Assigning old data from 'book' to alert's textfields when Alert loads up
        alertController.textFields?[0].text = book.title
        alertController.textFields?[1].text = book.description
        alertController.textFields?[2].text = book.condition
        alertController.textFields?[3].text = book.price
        
        // Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
        }
        
        // Adding Update action
        alertController.addAction(updateAction)
        
        // Adding Cancel action
        alertController.addAction(cancelAction)
        
        // Present Alert controller
        present(alertController, animated: true, completion: nil)
        
    }
    
    // Action for delete button
    @objc func deletePressed(sender: UIButton) {
        
        sender.flash()
        // Collection view indexPath.row = Button sender.tag
        let book = booksList[sender.tag]
        // Alert
        let alertController = UIAlertController(title: "Delete Book", message: "Are you sure you want to delete your posted book?", preferredStyle: .alert)
        
        // Delete action
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
            self.deleteBook(id: book.id!)
        }
        
        // Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
        }
        
        // Adding Delete action
        alertController.addAction(deleteAction)
        
        // Adding Cancel action
        alertController.addAction(cancelAction)
        
        // Present Alert controller
        present(alertController, animated: true, completion: nil)
        
    }
    
    var textFieldRefTitle: UITextField!      // Textfield for From in Alert
    var textFieldRefDescription: UITextField!        // Textfield for To in Alert
    var textFieldRefCondition: UITextField!     // Textfield for Seats in Alert
    var textFieldRefPrice: UITextField!      // Textfield for Date&Time in Alert
    
    // Func for Title textfield
    func titleFunc(textField: UITextField!) {
        textField.tag = 0
        textFieldRefTitle = textField        // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Description textfield
    func descriptionFunc(textField: UITextField!) {
        textField.tag = 1
        textFieldRefDescription = textField          // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Condition textfield
    func conditionFunc(textField: UITextField!) {
        textField.tag = 2
        textField.inputView = pickerBooksCondition
        textFieldRefCondition = textField       // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Func for Price textfield
    func priceFunc(textField: UITextField!) {
        textField.tag = 3
        textField.keyboardType = .decimalPad
        textFieldRefPrice = textField        // Equating this textfield to global textfield reference
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        textField.addConstraint(heightConstraint)
    }
    
    // Update Book func
    func updateBook(id: String, newTitle: String, newDescription: String, newCondition: String, newPrice: String) {
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        
        let book = [
            "1) id": id,
            "2) Title": textFieldRefTitle.text!,
            "3) Description": textFieldRefDescription.text!,
            "4) Condition": textFieldRefCondition.text!,
            "5) Price": textFieldRefPrice.text!,
            "6) Timestamp": timestamp
            ] as [String : Any]
        refBooks.child(id).setValue(book)
    }
    
    // Delete Book func
    func deleteBook(id: String) {
        refBooks.child(id).setValue(nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // center activity indicator
        /// this line centers for lower iOS versions too..
        activityIndicatorView4.center = self.view.center
        /// these 2 lines work only from iOS 13.0
        // activityIndicatorView4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // activityIndicatorView4.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView4.startAnimating()
        
        // Register CollectionViewCell 'Cell3' here
        cardCollectionView2.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cardCollectionView.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))

        // Register CollectionViewCell 'Cell4' here
        cardCollectionView2.register(UINib.init(nibName: "Cell4", bundle: nil), forCellWithReuseIdentifier: "Cell4")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        
        pickerBooksCondition.delegate = self                  // Set delegate
        pickerBooksCondition.dataSource = self                // Set datasource
        
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
                    let bookTimestamp = bookObject?["6) Timestamp"]
                    
                    let book = BooksModel(id: bookId as! String?, title: bookTitle as! String?, description: bookDescription as! String?, condition: bookCondition as! String?, price: bookPrice as! String?, timestamp: bookTimestamp as! Double?)
                    self.booksList.append(book)
                }
                self.activityIndicatorView4.stopAnimating()
                self.activityIndicatorView4.hidesWhenStopped = true
                self.cardCollectionView2.reloadData()
                
            }
            
        })
        
    }

}   // #299
