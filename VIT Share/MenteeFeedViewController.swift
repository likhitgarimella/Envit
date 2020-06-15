//
//  MenteeFeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenteeFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var menteeFeedCollectionView: UICollectionView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menteeList.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let menteeCell = menteeFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "MenteePostCell", for: indexPath) as! MenteePostCell
        
        let mentee: MenteeModel
        mentee = menteeList[indexPath.row]
        menteeCell.domainName.text = mentee.domainText
        menteeCell.postedQueryTextView.text = mentee.postQueryText
        /* if let seconds = mentor.timestamp {
            // let timeStampDate = NSDate(timeIntervalSince1970: seconds)
            let pastDate = Date(timeIntervalSince1970: seconds)
            // let dateFormatter = DateFormatter()
            // dateFormatter.dateFormat = "MMM d, h:mm a"
            // cell.timeAgo.text = dateFormatter.string(from: timeStampDate as Date)
            // cell.timeAgo.text = pastDate.timeAgoDisplay()
        } */
        // linking mentee feed VC & mentee post cell
        menteeCell.menteeFeedVC = self
        return menteeCell
        
    }
    
    var menteeList = [MenteeModel]()
    var refMentees: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CollectionViewCell 'MenteePostCell' here
        menteeFeedCollectionView.register(UINib.init(nibName: "MenteePostCell", bundle: nil), forCellWithReuseIdentifier: "MenteePostCell")
        if let flowLayout = menteeFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        refMentees = Database.database().reference().child("Mentees").child("Details")
        refMentees.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.menteeList.removeAll()
                for mentees in snapshot.children.allObjects as! [DataSnapshot] {
                    let menteeObject = mentees.value as? [String: AnyObject]
                    let menteeId = menteeObject?["1) id"]
                    let menteeDomain  = menteeObject?["2) Domain"]
                    let menteePost  = menteeObject?["3) Post Query"]
                    let menteeTimestamp = menteeObject?["4) Timestamp"]
                    
                    let mentee = MenteeModel(id: menteeId as! String?, domainText: menteeDomain as! String?, postQueryText: menteePost as! String?, timestamp: menteeTimestamp as! Double?)
                    self.menteeList.append(mentee)
                }
                self.menteeFeedCollectionView.reloadData()
                
            }
            
        })
        
    }
    
}   // #82
