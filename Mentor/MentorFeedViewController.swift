//
//  MentorFeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
// import FirebaseDatabase

class MentorFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var mentorFeedCollectionView: UICollectionView!
    
    @IBOutlet var activityIndicatorView6: UIActivityIndicatorView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mentorPosts.count
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
        
        let mentorCell = mentorFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "MentorPostCell", for: indexPath) as! MentorPostCell
        let post = mentorPosts[indexPath.row]
        let user = users[indexPath.row]
        mentorCell.mentorPost = post
        mentorCell.user = user
        // linking home VC & home table view cell
        mentorCell.mentorFeedVC = self
        return mentorCell
        
    }
    
    // reference to store MentorModel class info
    var mentorPosts = [MentorModel]()
    
    // reference to store User class info
    var users = [AppUser]()
    
    // DB ref
    // --- var refMentors: DatabaseReference!
    
    // load mentor posts
    func loadPosts() {
        
        // start when loadPosts func starts
        activityIndicatorView6.startAnimating()
        
        Api.MentorPost.observePosts { (post) in
            guard let postId = post.uid else {
                return
            }
            // fetch user data in mentor posts
            self.fetchUser(uid: postId, completed: {
                self.mentorPosts.append(post)
                // print(self.posts)
                /// stop before tablew view reloads data
                self.activityIndicatorView6.stopAnimating()
                self.activityIndicatorView6.hidesWhenStopped = true
                self.mentorFeedCollectionView.reloadData()
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
        if segue.identifier == "commentsInMentorFeed" {
            let commentVC = segue.destination as! CommentsInMentorPostFeed
            //
            let postId = sender as! String
            commentVC.postId = postId
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CollectionViewCell 'MentorPostCell' here
        mentorFeedCollectionView.register(UINib.init(nibName: "MentorPostCell", bundle: nil), forCellWithReuseIdentifier: "MentorPostCell")
        if let flowLayout = mentorFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        loadPosts()
        
    }
    
}   // #114
