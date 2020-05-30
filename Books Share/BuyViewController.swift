//
//  BuyViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BuyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var cardCollectionView: UICollectionView!
    
    @IBOutlet var activityIndicatorView3: UIActivityIndicatorView!
    
    var booksList = [BooksModel]()
    
    var refBooks: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! Cell3
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        // cell.hideAnimation()
        let book: BooksModel
        book = booksList[indexPath.row]
        cell.bookTitle.text = book.title
        cell.bookDescription.text = book.description
        cell.conditionValue.text = book.condition
        cell.price.text = String(book.price!)
        
        if let seconds = book.timestamp {
            // let timeStampDate = NSDate(timeIntervalSince1970: seconds)
            let pastDate = Date(timeIntervalSince1970: seconds)
            // let dateFormatter = DateFormatter()
            // dateFormatter.dateFormat = "MMM d, h:mm a"
            // cell.timeAgo.text = dateFormatter.string(from: timeStampDate as Date)
            cell.timeAgo.text = pastDate.timeAgoDisplay()
        }
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // center activity indicator
        /// this line centers for lower iOS versions too..
        activityIndicatorView3.center = self.view.center
        /// these 2 lines work only from iOS 13.0
        // activityIndicatorView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // activityIndicatorView3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView3.startAnimating()
        
        // Register CollectionViewCell 'Cell3' here
        cardCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cardCollectionView.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))
        
        cardCollectionView.register(UINib.init(nibName: "Cell3", bundle: nil), forCellWithReuseIdentifier: "Cell3")
        if let flowLayout = cardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        
        refBooks = Database.database().reference().child("Books").child("Details")
        refBooks.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.booksList.removeAll()
                for books in snapshot.children.allObjects as! [DataSnapshot] {
                    let bookObject = books.value as? [String: AnyObject]
                    let bookId = bookObject?["1) id"]
                    let bookTitle  = bookObject?["2) Title"]
                    let bookDesc  = bookObject?["3) Description"]
                    let bookCond = bookObject?["4) Condition"]
                    let bookPrice = bookObject?["5) Price"]
                    let bookTimestamp = bookObject?["6) Timestamp"]
                    
                    let book = BooksModel(id: bookId as! String?, title: bookTitle as! String?, description: bookDesc as! String?, condition: bookCond as! String?, price: bookPrice as! String?, timestamp: bookTimestamp as! Double?)
                    self.booksList.append(book)
                }
                self.activityIndicatorView3.stopAnimating()
                self.activityIndicatorView3.hidesWhenStopped = true
                self.cardCollectionView.reloadData()
                
            }
            
        })
        
    }

}   // #106
