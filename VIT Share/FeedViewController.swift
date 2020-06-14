//
//  FeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // Outlets
    @IBOutlet var mentorSwitch: UISwitch!
    @IBOutlet var menteeSwitch: UISwitch!
    
    @IBOutlet var mentorFeedView: UIView!
    @IBOutlet var menteeFeedView: UIView!
    
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
    
    var refMentors: DatabaseReference!
    
    
     /*
     
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
        hideKeyboardWhenTappedAround()
        
        /*
        
        // Register CollectionViewCell 'MentorPostCell' here
        feedCollectionView.register(UINib.init(nibName: "MentorPostCell", bundle: nil), forCellWithReuseIdentifier: "MentorPostCell")
        if let flowLayout = feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
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
 
        */
        
    }
    
}   // #201
