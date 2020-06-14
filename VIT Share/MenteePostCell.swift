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
    
    @IBOutlet var bottomView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        postedQueryTextView.layer.cornerRadius = 6
        postedQueryTextView.backgroundColor = UIColor.white
        
        postedQueryTextView.dataDetectorTypes = .link
        
    }

}   // #38
