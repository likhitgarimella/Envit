//
//  FindRideViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import SkeletonView

class FindRideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    // Outlets
    
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    @IBOutlet var cardCollectionView: UICollectionView!
    
    // This function is just to enable / display the Search bar.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
    
    var searchFromPlace: [String?] = []     // The Search filer we want.
    var searching = false       // Property which decides which array to generate, the filter search array or full array.
    // ⬆️ Initially set to false
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return searchFromPlace.count    // Setting count of No of filter search cells = No of collection view cells to be displayed.
        } else {
        return fromLocArr.count     // Else, display entire 'fromLocArr' in collection view.
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        if fromLocArr != nil {
            cell.hideAnimation()
            cell.fromPlace.text = fromLocArr[indexPath.row]         // Display data that is retrieved, into the cells.
            cell.toPlace.text = toLocArr[indexPath.row]             // Display data that is retrieved, into the cells.
            cell.noOfSeatsValue.text = noOfSeatsArr[indexPath.row]  // Display data that is retrieved, into the cells.
        }
        
        // cell.dataAndTime.text = dateAndTimeArr[indexPath.row]  // Display data that is retrieved, into the cells.    // Undo this
        if searching {
            cell.fromPlace.text = searchFromPlace[indexPath.row]    // The 'fromPlace' textfields in collection view cells will be updated to 'searchFromPlace' array.
        } else {
            cell.fromPlace.text = fromLocArr[indexPath.row]     // If searching not done, return all elements in the array.
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {        // Search bar delegate function.
        searchFromPlace = fromLocArr.filter({$0!.prefix(searchText.count) == searchText})
        // Filter the 'fromLoc' array by prefix.
        // ⬆️ From this, we get to know number of elements from 'fromLoc' array.
        // All the filtered searches will be stored in 'searchFromPlace' array.
        searching = true    // Enable 'searching'
        cardCollectionView.reloadData()     // After this ⬆️, reload collection view.
    }
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        if let flowLayout = cardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        retrieveData()
        
    }
    
    var fromLocArr: [String?] = []
    var toLocArr: [String?] = []
    var noOfSeatsArr: [String?] = []
    // var dateAndTimeArr: [String?] = []   // Undo this
    
    func retrieveData() {
        
        let dataDB = Database.database().reference().child("Rides").child("Details")
        
        dataDB.observe(.childAdded)   //This means whenever a new entry gets added into the messages database, and this parameter takes a closure
        { (snapshot) in
           
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            let fromLocn = snapshotValue["From"]!
            self.fromLocArr.append(snapshotValue["From"]!)
            let toLocn = snapshotValue["To"]!
            self.toLocArr.append(snapshotValue["To"]!)
            let noOfSeats = snapshotValue["Seats"]!
            self.noOfSeatsArr.append(snapshotValue["Seats"]!)
            // let dateTime = snapshotValue["Date"]!                // Undo this
            // self.dateAndTimeArr.append(snapshotValue["Date"]!)   // Undo this
            
            print(fromLocn, toLocn, noOfSeats)                      // Undo this
            self.cardCollectionView.reloadData()
        }
        
    }
    
}   // #114
