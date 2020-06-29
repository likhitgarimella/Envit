//
//  JCompProjPostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 29/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

}   // #36
