//
//  FeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FeedViewController: UIViewController {
    
    // Outlets
    @IBOutlet var mentorSwitch: UISwitch!
    @IBOutlet var menteeSwitch: UISwitch!
    
    @IBOutlet var mentorFeedView: UIView!
    @IBOutlet var menteeFeedView: UIView!
    
    // @IBOutlet var feedCollectionView: UICollectionView!
    
    // switch properties
    func Switch() {
        
        mentorSwitch.isOn = true
        menteeSwitch.isOn = false
        
    }
    
    @IBAction func enableMentor(_ sender: UISwitch) {
        
        menteeSwitch.setOn(!sender.isOn, animated: true)
        
        if mentorSwitch.isOn == true {
            mentorFeedView.alpha = 1
            menteeFeedView.alpha = 0
        }
        
        if menteeSwitch.isOn == true {
            menteeFeedView.alpha = 1
            mentorFeedView.alpha = 0
        }
        
    }
    
    @IBAction func enableMentee(_ sender: UISwitch) {
        
        mentorSwitch.setOn(!sender.isOn, animated: true)
        
        if mentorSwitch.isOn == true {
            mentorFeedView.alpha = 1
            menteeFeedView.alpha = 0
        }
        
        if menteeSwitch.isOn == true {
            menteeFeedView.alpha = 1
            mentorFeedView.alpha = 0
        }
        
    }
    
    var mentorList = [MentorModel]()
    var menteeList = [MenteeModel]()
    
    var refMentors: DatabaseReference!
    var refMentees: DatabaseReference!
    
    /*
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if menteeSwitch.isOn {
            return menteeList.count
        }
        else {
            return mentorList.count
        }
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if menteeSwitch.isOn {
            let menteeCell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "MenteePostCell", for: indexPath) as! MenteePostCell
            // cell.hideAnimation()
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
            return menteeCell
        }
        
        else {
            let mentorCell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "MentorPostCell", for: indexPath) as! MentorPostCell
            // cell.hideAnimation()
            let mentor: MentorModel
            mentor = mentorList[indexPath.row]
            mentorCell.domainName.text = mentor.domainText
            mentorCell.experienceTextView.text = mentor.experienceText
            mentorCell.courseTextView.text = mentor.coursesText
            mentorCell.prerequisiteTextView.text = mentor.prerequisitesText
            /* if let seconds = mentor.timestamp {
                // let timeStampDate = NSDate(timeIntervalSince1970: seconds)
                let pastDate = Date(timeIntervalSince1970: seconds)
                // let dateFormatter = DateFormatter()
                // dateFormatter.dateFormat = "MMM d, h:mm a"
                // cell.timeAgo.text = dateFormatter.string(from: timeStampDate as Date)
                // cell.timeAgo.text = pastDate.timeAgoDisplay()
            } */
            return mentorCell
        }
        
    }
 
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Switch()
        
        /*
        
        // Register CollectionViewCell 'MentorPostCell' here
        feedCollectionView.register(UINib.init(nibName: "MentorPostCell", bundle: nil), forCellWithReuseIdentifier: "MentorPostCell")
        if let flowLayout = feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        // Register CollectionViewCell 'MenteePostCell' here
        feedCollectionView.register(UINib.init(nibName: "MenteePostCell", bundle: nil), forCellWithReuseIdentifier: "MenteePostCell")
        if let flowLayout = feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        hideKeyboardWhenTappedAround()
        
        //
        refMentors = Database.database().reference().child("Mentors").child("Details")
        refMentors.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.mentorList.removeAll()
                for mentors in snapshot.children.allObjects as! [DataSnapshot] {
                    let mentorObject = mentors.value as? [String: AnyObject]
                    let mentorId = mentorObject?["1) id"]
                    let mentorDomain  = mentorObject?["2) Domain"]
                    let mentorExp  = mentorObject?["3) Experience"]
                    let mentorPrereq = mentorObject?["4) Prerequisites"]
                    let mentorCourses = mentorObject?["5) Courses"]
                    let mentorTimestamp = mentorObject?["6) Timestamp"]
                    
                    let mentor = MentorModel(id: mentorId as! String?, domainText: mentorDomain as! String?, experienceText: mentorExp as! String?, prerequisitesText: mentorPrereq as! String?, coursesText: mentorCourses as! String?, timestamp: mentorTimestamp as! Double?)
                    self.mentorList.append(mentor)
                }
                self.feedCollectionView.reloadData()
                
            }
            
        })
        
        //
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
                self.feedCollectionView.reloadData()
                
            }
            
        })
 
        */
        
    }
    
}   // #201
