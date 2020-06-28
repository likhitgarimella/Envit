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
        persProjCell.persProjFeedVC = self
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
    
    // load personal project posts
    func loadPosts() {
        
        Api.PersonalProjectPost.observePosts { (post) in
            guard let postId = post.uid else {
                return
            }
            // fetch user data in mentor posts
            self.fetchUser(uid: postId, completed: {
                self.personalProjectsPosts.append(post)
                // print(self.posts)
                /// stop before tablew view reloads data
                self.personalProjectsFeedCollectionView.reloadData()
            })
        }
        
    }
    
    /// it's job is to, given a user id, look up the corresponding user on db...
    func fetchUser(uid: String, completed: @escaping () -> Void) {
        
        Api.User.obersveUser(withId: uid, completion: { (user) in
            self.users.append(user)
            completed()
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        GeneralProp()
        
        // Register CollectionViewCell 'PersProjPostCell' here
        personalProjectsFeedCollectionView.register(UINib.init(nibName: "PersProjPostCell", bundle: nil), forCellWithReuseIdentifier: "PersProjPostCell")
        if let flowLayout = personalProjectsFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        loadPosts()
        
    }
    
}   // #112
