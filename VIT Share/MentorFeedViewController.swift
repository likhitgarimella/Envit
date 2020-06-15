//
//  MentorFeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MentorFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var mentorFeedCollectionView: UICollectionView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mentorList.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let mentorCell = mentorFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "MentorPostCell", for: indexPath) as! MentorPostCell
        
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
        // linking mentor feed VC & mentor post cell
        mentorCell.mentorFeedVC = self
        return mentorCell
        
    }
    
    var mentorList = [MentorModel]()
    var refMentors: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CollectionViewCell 'MentorPostCell' here
        mentorFeedCollectionView.register(UINib.init(nibName: "MentorPostCell", bundle: nil), forCellWithReuseIdentifier: "MentorPostCell")
        if let flowLayout = mentorFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
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
                self.mentorFeedCollectionView.reloadData()
                
            }
            
        })
        
    }
    
}   // #86
