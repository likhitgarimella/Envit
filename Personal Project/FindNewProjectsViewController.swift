//
//  FindNewProjectsViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FindNewProjectsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Outlets
    @IBOutlet var persProj: UIButton!
    
    @IBOutlet var personalProjectsFeedCollectionView: UICollectionView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personalProjectsPosts.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// Timestamp
        /* if let seconds = mentor.timestamp {
            // let timeStampDate = NSDate(timeIntervalSince1970: seconds)
            let pastDate = Date(timeIntervalSince1970: seconds)
            // let dateFormatter = DateFormatter()
            // dateFormatter.dateFormat = "MMM d, h:mm a"
            // cell.timeAgo.text = dateFormatter.string(from: timeStampDate as Date)
            // cell.timeAgo.text = pastDate.timeAgoDisplay()
        } */
        
        let persProjCell = personalProjectsFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "PersProjPostCell", for: indexPath) as! PersProjPostCell
        let post = personalProjectsPosts[indexPath.row]
        let user = users[indexPath.row]
        persProjCell.persProjPost = post
        persProjCell.user = user
        // linking home VC & home table view cell
        persProjCell.mentorFeedVC = self
        return persProjCell
        
    }
    
    // reference to store MentorModel class info
    var personalProjectsPosts = [PersonalProjectModel]()
    
    // reference to store User class info
    var users = [User]()
    
    // DB ref
    var refPersProjects: DatabaseReference!
    
    func GeneralProp() {
        
        persProj.layer.cornerRadius = 15
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        GeneralProp()
        
    }
    
}   // #76
