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

class ModifyRideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    /* //////////////////////////////////////////////////////////////////////////////// */
    
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    var ridesList = [RidesModel]()
    
    var refRides: DatabaseReference!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ridesList.count
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
    
    // didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let ride = ridesList[indexPath.row]
        let alertController = UIAlertController(title: "Update", message: "Update Values", preferredStyle: .alert)
        
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            let id = ride.id
            let newFrom = alertController.textFields?[0].text
            let newTo = alertController.textFields?[1].text
            let newSeats = alertController.textFields?[2].text
            self.updateRide(id: id!, newFrom: newFrom!, newTo: newTo!, newSeats: newSeats!)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
            
        }

        alertController.addAction(updateAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true, completion: nil)
        
        alertController.addTextField{(textField) in
            textField.text = ride.from
        }
        alertController.addTextField{(textField) in
            textField.text = ride.to
        }
        alertController.addTextField{(textField) in
            textField.text = ride.seats
        }
        
    }
    
    func updateRide(id: String, newFrom: String, newTo: String, newSeats: String) {
        
        let ride = [
            "id": id,
            "From": newFrom,
            "To": newTo,
            "Seats": newSeats
        ]
        refRides.child(id).setValue(ride)
        
    }
    
    /* //////////////////////////////////////////////////////////////////////////////// */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView2.register(UINib.init(nibName: "Cell2", bundle: nil), forCellWithReuseIdentifier: "Cell2")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        
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
                self.cardCollectionView2.reloadData()
                
            }
            
        })
        
    }
    
}   // #128
