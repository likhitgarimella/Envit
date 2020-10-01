//
//  PersProjPostCell.swift
//  Envit
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase

/// If a View needs data, it should ask controllers...

class PersProjPostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet var roleName: UILabel!
    @IBOutlet var projectName: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var personName: UILabel!
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var projectLikeImageView: UIImageView!
    @IBOutlet var projectCommentImageView: UIImageView!
    
    @IBOutlet var likeCountButton: UIButton!
    
    // linking pers proj feed VC & pers proj post cell
    var persProjFeedVC: FindNewProjectsViewController?
    
    var persProjPost: PersonalProjectModel? {
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
        
        roleName.text = persProjPost?.role
        projectName.text = persProjPost?.projectTitle
        descriptionLabel.text = persProjPost?.projDesc
        print(roleName.text)
        print(projectName.text)
        print(descriptionLabel.text)
        
        setupUserInfo()
        
        /// Update like
        updateLike(post: persProjPost!)
        
        /// New
        self.updateLike(post: self.persProjPost!)
        
    }
    
    func updateLike(post: PersonalProjectModel) {
        
        // print(post.isLiked)
        /// we first checked if its true, and no one liked this post before..
        /// or if probably someone did, but the current user did not..
        /// then we display, non-selected like icon..
        /// otherwise, display likeSelected icon..
        let imageName = post.likes == nil || !post.isLiked! ? "Icon1" : "likeSelected"
        projectLikeImageView.image = UIImage(named: imageName)
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
        
        personName.text = user?.nameString
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial text
        personName.text = ""
        projectName.text = ""
        roleName.text = ""
        descriptionLabel.text = ""
        
        // corner radius
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        projectName.layer.cornerRadius = 6
        roleName.layer.cornerRadius = 6
        descriptionLabel.layer.cornerRadius = 6
        
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
        
        // Tap gesture for comment image on tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(commentImageViewTouch))
        projectCommentImageView.addGestureRecognizer(tapGesture)
        projectCommentImageView.isUserInteractionEnabled = true
        
        // Tap gesture for like image on tap
        let tapGestureForLikeImageView = UITapGestureRecognizer(target: self, action: #selector(likeImageViewTouch))
        projectLikeImageView.addGestureRecognizer(tapGestureForLikeImageView)
        projectLikeImageView.isUserInteractionEnabled = true
        
    }
    
    
    @objc func likeImageViewTouch() {
        
        /// New
        Api.PersonalProjectPost.incrementLikes(postId: persProjPost!.id!, onSuccess: { (post) in
            self.updateLike(post: post)
            /// New #2
            /// Now the post property of the cell is updated right after a like/dislike
            self.persProjPost?.likes = post.likes
            self.persProjPost?.isLiked = post.isLiked
            self.persProjPost?.likeCount = post.likeCount
        }) { (errorMessage) in
            // hud
            print(errorMessage!)
        }
        
    }
    
    @objc func commentImageViewTouch() {
        
        if let id = persProjPost?.uid {
            persProjFeedVC?.performSegue(withIdentifier: "commentsInPerProFeed", sender: id)
        }
        
    }

}   // #178
