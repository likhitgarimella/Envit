//
//  MentorPostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 02/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class MentorPostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet var domainName: UILabel!
    @IBOutlet var experienceTextView: UITextView!
    @IBOutlet var courseTextView: UITextView!
    @IBOutlet var prerequisiteTextView: UITextView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var mentorLikeImageView: UIImageView!
    @IBOutlet var mentorCommentImageView: UIImageView!
    
    @IBOutlet var likeCountButton: UIButton!
    
    // linking mentor feed VC & mentor post cell
    var mentorFeedVC: MentorFeedViewController?
    
    // db ref
    var mentorPostRef: DatabaseReference!
    
    var mentorPost: MentorModel? {
        didSet {
            updateView()
        }
    }
    
    /// when this user property is set..
    /// we'll let the cell download the correspoding cell..
    var user: User? {
        didSet {
            setupUserInfo()
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
        experienceTextView.text = ""
        courseTextView.text = ""
        prerequisiteTextView.text = ""
        
        // corner radius
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        experienceTextView.layer.cornerRadius = 6
        courseTextView.layer.cornerRadius = 6
        prerequisiteTextView.layer.cornerRadius = 6
        
        // constraint
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        // text view
        experienceTextView.backgroundColor = UIColor.white
        courseTextView.backgroundColor = UIColor.white
        prerequisiteTextView.backgroundColor = UIColor.white
        courseTextView.dataDetectorTypes = .link
        
        // Tap gesture for comment image on tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(commentImageViewTouch))
        mentorCommentImageView.addGestureRecognizer(tapGesture)
        mentorCommentImageView.isUserInteractionEnabled = true
        
        // Tap gesture for like image on tap
        let tapGestureForLikeImageView = UITapGestureRecognizer(target: self, action: #selector(likeImageViewTouch))
        mentorLikeImageView.addGestureRecognizer(tapGestureForLikeImageView)
        mentorLikeImageView.isUserInteractionEnabled = true
        
    }
    
    @objc func commentImageViewTouch() {
        
        mentorFeedVC?.performSegue(withIdentifier: "commentsInMentorFeed", sender: nil)
        
    }

}   // #104
