//
//  JComponentFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 27/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class JComponentFeed: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var jCompProjectsFeedCollectionView: UICollectionView!
    
    @IBOutlet var activityIndicatorView8: UIActivityIndicatorView!
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jCompProjectsPosts.count
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
        
        let jCompProjCell = jCompProjectsFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "JCompProjPostCell", for: indexPath) as! JCompProjPostCell
        let post = jCompProjectsPosts[indexPath.row]
        let user = users[indexPath.row]
        jCompProjCell.jCompProjPost = post
        jCompProjCell.user = user
        // linking home VC & home table view cell
        jCompProjCell.jCompProjFeedVC = self
        return jCompProjCell
        
    }
    
    // reference to store JComponentProjectModel class info
    var jCompProjectsPosts = [JComponentProjectModel]()
    
    // reference to store User class info
    var users = [AppUser]()
    
    // DB ref
    var refJCompProjects: DatabaseReference!
    
    // load jcomp project posts
    func loadPosts() {
        
        // start when loadPosts func starts
        activityIndicatorView8.startAnimating()
        
        Api.JComponentProjectPost.observePosts { (post) in
            guard let postId = post.uid else {
                return
            }
            // fetch user data in mentor posts
            self.fetchUser(uid: postId, completed: {
                self.jCompProjectsPosts.append(post)
                // print(self.posts)
                /// stop before tablew view reloads data
                self.activityIndicatorView8.stopAnimating()
                self.activityIndicatorView8.hidesWhenStopped = true
                self.jCompProjectsFeedCollectionView.reloadData()
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
        if segue.identifier == "commentsInJProFeed" {
            let commentVC = segue.destination as! CommentsInJCompProjFeed
            //
            let postId = sender as! String
            commentVC.postId = postId
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        
        // Register CollectionViewCell 'JCompProjPostCell' here
        jCompProjectsFeedCollectionView.register(UINib.init(nibName: "JCompProjPostCell", bundle: nil), forCellWithReuseIdentifier: "JCompProjPostCell")
        if let flowLayout = jCompProjectsFeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        loadPosts()
        
    }
    
}   // #120
