//
//  FindRideViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FindRideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
   
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    @IBOutlet var cardCollectionView: UICollectionView!
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // This function is just to enable / display the Search bar.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
    
    var searchFromPlace: [String?] = []     // The Search filer we want.
    var searching = false       // Property which decides which array to generate, the filter search array or full array.
    // ⬆️ Initially set to false
    
    var ridesList = [RidesModel]()
    
    var refRides: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /* if searching {
            return searchFromPlace.count    // Setting count of No of filter search cells = No of collection view cells to be displayed.
        } else {
        return fromLocArr.count     // Else, display entire 'fromLocArr' in collection view.
        } */
        return ridesList.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        /* if fromLocArr != nil {
            cell.hideAnimation()
            cell.fromPlace.text = fromLocArr[indexPath.row]         // Display data that is retrieved, into the cells.
            cell.toPlace.text = toLocArr[indexPath.row]             // Display data that is retrieved, into the cells.
            cell.noOfSeatsValue.text = noOfSeatsArr[indexPath.row]  // Display data that is retrieved, into the cells.
        }
        
        cell.dateAndTime.text = dateAndTimeArr[indexPath.row]  // Display data that is retrieved, into the cells.
        if searching {
            cell.fromPlace.text = searchFromPlace[indexPath.row]    // The 'fromPlace' textfields in collection view cells will be updated to 'searchFromPlace' array.
        } else {
            cell.fromPlace.text = fromLocArr[indexPath.row]     // If searching not done, return all elements in the array.
        }
        return cell */
        
        let ride: RidesModel
        ride = ridesList[indexPath.row]
        cell.fromPlace.text = ride.from
        cell.toPlace.text = ride.to
        cell.noOfSeatsValue.text = ride.seats
        cell.dateAndTime.text = ride.dateTime
        return cell
        
    }
    
    /* func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {        // Search bar delegate function.
        searchFromPlace = fromLocArr.filter({$0!.prefix(searchText.count) == searchText})
        // Filter the 'fromLoc' array by prefix.
        // ⬆️ From this, we get to know number of elements from 'fromLoc' array.
        // All the filtered searches will be stored in 'searchFromPlace' array.
        searching = true    // Enable 'searching'
        cardCollectionView.reloadData()     // After this ⬆️, reload collection view.
    } */
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // center activity indicator
        /// this line centers for lower iOS versions too..
        activityIndicatorView.center = self.view.center
        /// these 2 lines work only from iOS 13.0
        // activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.startAnimating()
        
        // Register CollectionViewCell 'Cell3' here
        cardCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        // cardCollectionView.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))
        
        // Register CollectionViewCell 'Cell' here
        cardCollectionView.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        if let flowLayout = cardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        // retrieveData()
        
        refRides = Database.database().reference().child("Rides").child("Details")
        refRides.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.ridesList.removeAll()
                for rides in snapshot.children.allObjects as! [DataSnapshot] {
                    let rideObject = rides.value as? [String: AnyObject]
                    let rideId = rideObject?["id"]
                    let rideFrom  = rideObject?["From"]
                    let rideTo  = rideObject?["To"]
                    let rideSeats = rideObject?["Seats"]
                    let rideDateTime = rideObject?["Date"]
                    
                    let ride = RidesModel(id: rideId as! String?, from: rideFrom as! String?, to: rideTo as! String?, seats: rideSeats as! String?, dateTime: rideDateTime as! String?)
                    self.ridesList.append(ride)
                }
                
                self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.hidesWhenStopped = true
                self.cardCollectionView.reloadData()
                
            }
            
        })
        
    }
    
    // var fromLocArr: [String?] = []
    // var toLocArr: [String?] = []
    // var noOfSeatsArr: [String?] = []
    // var dateAndTimeArr: [String?] = []
    
    /* func retrieveData() {
        
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
            let dateTime = snapshotValue["Date"]!
            self.dateAndTimeArr.append(snapshotValue["Date"]!)
            
            print(fromLocn, toLocn, noOfSeats, dateTime)
            self.cardCollectionView.reloadData()
        }
        
    } */
    
}   // #172
