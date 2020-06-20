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
        return menteePosts.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /* let menteeCell = menteeFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "MenteePostCell", for: indexPath) as! MenteePostCell
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
        return menteeCell */
        
        let menteeCell = menteeFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "MenteePostCell", for: indexPath) as! MenteePostCell
        let post = menteePosts[indexPath.row]
        let user = users[indexPath.row]
        menteeCell.menteePost = post
        menteeCell.user = user
        // linking home VC & home table view cell
        menteeCell.menteeFeedVC = self
        return menteeCell
        
    }
    
    // reference to store MenteeModel class info
    var menteePosts = [MenteeModel]()
    
    // reference to store User class info
    var users = [User]()
    
    var refMentees: DatabaseReference!
    
    func loadPosts() {
        
        Api.MenteePost.observePosts { (post) in
            guard let postId = post.uid else {
                return
            }
            self.fetchUser(uid: postId, completed: {
                self.menteePosts.append(post)
                // print(self.posts)
                // stop before tablew view reloads data
                self.menteeFeedCollectionView.reloadData()
            })
        }
        
    }
    
    /// it's job is to...
    /// given a user id, look up the corresponding user on db...
    func fetchUser(uid: String, completed: @escaping () -> Void) {
        
        Api.User.obersveUser(withId: uid, completion: { (user) in
            self.users.append(user)
            completed()
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CollectionViewCell 'MenteePostCell' here
        menteeFeedCollectionView.register(UINib.init(nibName: "MenteePostCell", bundle: nil), forCellWithReuseIdentifier: "MenteePostCell")
        if let flowLayout = menteeFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        loadPosts()
        
    }
    
}   // #82
