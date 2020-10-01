//
//  MentorPostCell.swift
//  Envit
//
//  Created by Likhit Garimella on 02/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase

/// If a View needs data, it should ask controllers...

class MentorPostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet var domainName: UILabel!
    @IBOutlet var experienceTextView: UILabel!
    @IBOutlet var courseTextView: UILabel!
    @IBOutlet var prerequisiteTextView: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var mentorLikeImageView: UIImageView!
    @IBOutlet var mentorCommentImageView: UIImageView!
    
    @IBOutlet var likeCountButton: UIButton!
    
    // linking mentor feed VC & mentor post cell
    var mentorFeedVC: MentorFeedViewController?
    
    var mentorPost: MentorModel? {
        didSet {
            updateView()
        }
    }
    
    /// when this user property is set..
    /// we'll let the cell download the correspoding cell..
    var user: AppUser? {
        didSet {
            setupUserInfo()
        }
    }
    
    func updateView() {
        
        domainName.text = mentorPost?.domainText
        experienceTextView.text = mentorPost?.experienceText
        courseTextView.text = mentorPost?.coursesText
        prerequisiteTextView.text = mentorPost?.prerequisitesText
        print(domainName.text)
        print(experienceTextView.text)
        print(courseTextView.text)
        print(prerequisiteTextView.text)
        
        setupUserInfo()
        
        /// Update like
        updateLike(post: mentorPost!)
        
        /// New
        self.updateLike(post: self.mentorPost!)
        
        /// Old
        /*
        /// Update like count
        Api.MentorPost.REF_POSTS.child(mentorPost!.id!).observe(.childChanged, with: {
            snapshot in
            print(snapshot)
            if let value = snapshot.value as? Int {
                self.likeCountButton.setTitle("\(value) likes", for: .normal)
            }
        })
        
        /// Smoothly update like, when scrolling view
        Api.MentorPost.REF_POSTS.child(mentorPost!.id!).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let post = MentorModel.transformMentorPost(dict: dict, key: snapshot.key)
                self.updateLike(post: post)
            }
        })
        */
        
    }
    
    func updateLike(post: MentorModel) {
        
        // print(post.isLiked)
        /// we first checked if its true, and no one liked this post before..
        /// or if probably someone did, but the current user did not..
        /// then we display, non-selected like icon..
        /// otherwise, display likeSelected icon..
        let imageName = post.likes == nil || !post.isLiked! ? "Icon1" : "likeSelected"
        mentorLikeImageView.image = UIImage(named: imageName)
        /// Below commented snippet can be put in 1 line.. as above..
        /* if post.isLiked == false {
            likeImageView.image = UIImage(named: "like")
        } else {
            likeImageView.image = UIImage(named: "likeSelected")
        } */
        
        // We now update like count
        /// Use optional chaining with guard
        guard let count = post.likeCount else {
            return
        }
        if count != 0 {
            likeCountButton.setTitle("\(count) likes", for: .normal)
        } else {
            likeCountButton.setTitle("0 likes", for: .normal)
        }
        
    }
    
    /// New setupUserInfo() func
    /// previously, our cell had to go look up the db for a user based on the uid...
    /// it now knows all that information already...
    func setupUserInfo() {
        
        nameLabel.text = user?.nameString
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial text
        nameLabel.text = ""
        domainName.text = ""
        experienceTextView.text = ""
        courseTextView.text = ""
        prerequisiteTextView.text = ""
        
        // corner radius
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        experienceTextView.layer.cornerRadius = 6
        courseTextView.layer.cornerRadius = 6
        prerequisiteTextView.layer.cornerRadius = 6
        
        // shadow properties
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowRadius = 2.0
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.masksToBounds = false
        
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        bottomView.layer.shadowRadius = 1.0
        bottomView.layer.shadowOpacity = 0.32
        bottomView.layer.masksToBounds = false
        
        // constraint
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        // courseTextView.dataDetectorTypes = .link
        
        // Tap gesture for comment image on tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(commentImageViewTouch))
        mentorCommentImageView.addGestureRecognizer(tapGesture)
        mentorCommentImageView.isUserInteractionEnabled = true
        
        // Tap gesture for like image on tap
        let tapGestureForLikeImageView = UITapGestureRecognizer(target: self, action: #selector(likeImageViewTouch))
        mentorLikeImageView.addGestureRecognizer(tapGestureForLikeImageView)
        mentorLikeImageView.isUserInteractionEnabled = true
        
    }
    
    @objc func likeImageViewTouch() {
        
        /// Old
        /*
        mentorPostRef = Api.MentorPost.REF_POSTS.child(mentorPost!.id!)
        incrementLikes(forRef: mentorPostRef)
        */
        
        /// New
        Api.MentorPost.incrementLikes(postId: mentorPost!.id!, onSuccess: { (post) in
            self.updateLike(post: post)
            /// New #2
            /// Now the post property of the cell is updated right after a like/dislike
            self.mentorPost?.likes = post.likes
            self.mentorPost?.isLiked = post.isLiked
            self.mentorPost?.likeCount = post.likeCount
        }) { (errorMessage) in
            // hud
            print(errorMessage!)
        }
        
    }
    
    @objc func commentImageViewTouch() {
        
        if let id = mentorPost?.uid {
            mentorFeedVC?.performSegue(withIdentifier: "commentsInMentorFeed", sender: id)
        }
        
    }

}   // #210
