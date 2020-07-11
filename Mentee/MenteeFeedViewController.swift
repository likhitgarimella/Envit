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
    
    @IBOutlet var activityIndicatorView5: UIActivityIndicatorView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menteePosts.count
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
    var users = [AppUser]()
    
    // DB ref
    var refMentees: DatabaseReference!
    
    // load mentee posts
    func loadPosts() {
        
        // start when loadPosts func starts
        activityIndicatorView5.startAnimating()
        
        Api.MenteePost.observePosts { (post) in
            guard let postId = post.uid else {
                return
            }
            // fetch user data in mentee posts
            self.fetchUser(uid: postId, completed: {
                self.menteePosts.append(post)
                // print(self.posts)
                /// stop before tablew view reloads data
                self.activityIndicatorView5.stopAnimating()
                self.activityIndicatorView5.hidesWhenStopped = true
                self.menteeFeedCollectionView.reloadData()
            })
        }
        
    }
    
    /// it's job is to, given a user id, look up the corresponding user on db...
    func fetchUser(uid: String, completed: @escaping () -> Void) {
        
        Api.UserDet.obersveUser(withId: uid, completion: { (user) in
            self.users.append(user)
            completed()
        })
        
    }
    
    // prepare for segue to comments vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "commentsInMenteeFeed" {
            let commentVC = segue.destination as! CommentsInMenteePostFeed
            //
            let postId = sender as! String
            commentVC.postId = postId
        }
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
    
}   // #114
