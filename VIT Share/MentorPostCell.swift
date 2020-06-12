//
//  MentorPostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 02/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class MentorPostCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet var experienceTextView: UITextView!
    @IBOutlet var courseTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        experienceTextView.layer.cornerRadius = 6
        courseTextView.layer.cornerRadius = 6
        experienceTextView.backgroundColor = UIColor.white
        courseTextView.backgroundColor = UIColor.white
        courseTextView.dataDetectorTypes = .link
        
    }

}   // #36
