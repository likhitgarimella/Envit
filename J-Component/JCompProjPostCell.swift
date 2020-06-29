//
//  JCompProjPostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 29/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class JCompProjPostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet var personName: UILabel!
    @IBOutlet var courseName: UILabel!
    @IBOutlet var projectName: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var projectLikeImageView: UIImageView!
    @IBOutlet var projectCommentImageView: UIImageView!
    
    @IBOutlet var likeCountButton: UIButton!
    
    // linking jcomp proj feed VC & jcomp proj post cell
    var jCompProjFeedVC: JComponentFeed?
    
    // db ref
    var jCompProjectsRef: DatabaseReference!
    
    var jCompProjPost: JComponentProjectModel? {
        didSet {
            
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
        
        personName.text = user?.nameString
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial text
        personName.text = ""
        courseName.text = ""
        projectName.text = ""
        descriptionLabel.text = ""
        
        // corner radius
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        
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
        
    }

}   // #90
