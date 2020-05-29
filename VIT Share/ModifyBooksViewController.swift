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

}   // #100
