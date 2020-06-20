//
//  MenteePostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 02/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

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
    
    // linking mentee feed VC & mentee post cell
    var menteeFeedVC: MenteeFeedViewController?
    
    var menteePost: MenteeModel? {
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
    
    func updateView() {
        
        domainName.text = menteePost?.domainText
        postedQueryTextView.text = menteePost?.postQueryText
        
        setupUserInfo()
        
    }
    
    func setupUserInfo() {
        
        nameLabel.text = user?.nameString
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.text = ""
        domainName.text = ""
        postedQueryTextView.text = ""
        
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        postedQueryTextView.layer.cornerRadius = 6
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        postedQueryTextView.backgroundColor = UIColor.white
        postedQueryTextView.dataDetectorTypes = .link
        
        // Tap gesture for comment image on tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(commentImageViewTouch))
        menteeCommentImageView.addGestureRecognizer(tapGesture)
        menteeCommentImageView.isUserInteractionEnabled = true
        
    }
    
    @objc func commentImageViewTouch() {
        
        if let id = menteePost?.uid {
            menteeFeedVC?.performSegue(withIdentifier: "commentsInMenteeFeed", sender: id)
        }
        
    }

}   // #54
