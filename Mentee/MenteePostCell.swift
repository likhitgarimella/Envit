//
//  MenteePostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 02/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class MenteePostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet var domainName: UILabel!
    @IBOutlet var postedQueryTextView: UITextView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var menteeLikeImageView: UIImageView!
    @IBOutlet var menteeCommentImageView: UIImageView!
    
    @IBOutlet var likeCountButton: UIButton!
    
    // linking mentee feed VC & mentee post cell
    var menteeFeedVC: MenteeFeedViewController?
    
    // db ref
    var menteePostRef: DatabaseReference!
    
    var menteePost: MenteeModel? {
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
        
        domainName.text = menteePost?.domainText
        postedQueryTextView.text = menteePost?.postQueryText
        
        setupUserInfo()
        
        /// Update like
        updateLike(post: menteePost!)
        
        /// Update like count
        Api.MenteePost.REF_POSTS.child(menteePost!.id!).observe(.childChanged, with: {
            snapshot in
            print(snapshot)
            if let value = snapshot.value as? Int {
                self.likeCountButton.setTitle("\(value) likes", for: .normal)
            }
        })
        
        /// Smoothly update like, when scrolling view
        Api.MenteePost.REF_POSTS.child(menteePost!.id!).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let post = MenteeModel.transformMenteePost(dict: dict, key: snapshot.key)
                self.updateLike(post: post)
            }
        })
        
    }
    
    func updateLike(post: MenteeModel) {
        
        // print(post.isLiked)
        /// we first checked if its true, and no one liked this post before..
        /// or if probably someone did, but the current user did not..
        /// then we display, non-selected like icon..
        /// otherwise, display likeSelected icon..
        let imageName = post.likes == nil || !post.isLiked! ? "Icon1" : "likeSelected"
        menteeLikeImageView.image = UIImage(named: imageName)
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
    func setupUserInfo() {
        
        nameLabel.text = user?.nameString
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial text
        nameLabel.text = ""
        domainName.text = ""
        postedQueryTextView.text = ""
        
        // corner radius
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        postedQueryTextView.layer.cornerRadius = 6
        
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
        
        // text view
        postedQueryTextView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        postedQueryTextView.dataDetectorTypes = .link
        
        // Tap gesture for comment image on tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(commentImageViewTouch))
        menteeCommentImageView.addGestureRecognizer(tapGesture)
        menteeCommentImageView.isUserInteractionEnabled = true
        
        // Tap gesture for like image on tap
        let tapGestureForLikeImageView = UITapGestureRecognizer(target: self, action: #selector(likeImageViewTouch))
        menteeLikeImageView.addGestureRecognizer(tapGestureForLikeImageView)
        menteeLikeImageView.isUserInteractionEnabled = true
        
    }
    
    @objc func commentImageViewTouch() {
        
        if let id = menteePost?.uid {
            menteeFeedVC?.performSegue(withIdentifier: "commentsInMenteeFeed", sender: id)
        }
        
    }
    
    @objc func likeImageViewTouch() {
        
        /// Scalable way of liking posts.. new method..
        menteePostRef = Api.MenteePost.REF_POSTS.child(menteePost!.id!)
        incrementLikes(forRef: menteePostRef)
        
    }
    
    func incrementLikes(forRef ref: DatabaseReference) {
        
        ref.runTransactionBlock ({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String: AnyObject], let uid = Auth.auth().currentUser?.uid {
                // print("Value 1: \(currentData.value)")
                var likes: Dictionary<String, Bool>
                likes = post["likes"] as? [String: Bool] ?? [:]
                var likeCount = post["likeCount"] as? Int ?? 0
                if let _ = likes[uid] {
                    likeCount -= 1
                    likes.removeValue(forKey: uid)
                } else {
                    likeCount += 1
                    likes[uid] = true
                }
                post["likeCount"] = likeCount as AnyObject
                post["likes"] = likes as AnyObject
                
                currentData.value = post
                
                return TransactionResult.success(withValue: currentData)
            }
            return TransactionResult.success(withValue: currentData)
        }) { (error, committed, snapshot) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            // print("Value 2: \(snapshot?.value)")
            if let dict = snapshot?.value as? [String: Any] {
                let post = MenteeModel.transformMenteePost(dict: dict, key: snapshot!.key)
                self.updateLike(post: post)
            }
            
        }
        
    }

}   // #216
