//
//  Cell2.swift
//  VIT Share
//
//  Created by Likhit Garimella on 20/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SkeletonView

class Cell2: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView2: UIView!
    @IBOutlet var widthConstraint2: NSLayoutConstraint!
    @IBOutlet var fromLabel2: UILabel!
    @IBOutlet var fromPlace2: UILabel!
    @IBOutlet var toLabel2: UILabel!
    @IBOutlet var toPlace2: UILabel!
    @IBOutlet var noOfSeatsLabel2: UILabel!
    @IBOutlet var noOfSeatsValue2: UILabel!
    @IBOutlet var dateAndTime2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView2.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint2.constant = screenWidth - (2 * 12)
        
        cardView2.showAnimatedGradientSkeleton()
        fromLabel2.showAnimatedGradientSkeleton()
        fromPlace2.showAnimatedGradientSkeleton()
        toLabel2.showAnimatedGradientSkeleton()
        toPlace2.showAnimatedGradientSkeleton()
        noOfSeatsLabel2.showAnimatedGradientSkeleton()
        noOfSeatsValue2.showAnimatedGradientSkeleton()
        dateAndTime2.showAnimatedGradientSkeleton()
        
        setupViews()
        
    }
    
    let editButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 284, y: 124, width: 32, height: 32))
        let btnImage = UIImage(named: "pen")
        button.setImage(btnImage, for: .normal)
        return button
    }()

    func setupViews()
    {
        addSubview(editButton)
    }
    
    func hideAnimation() {
        
        cardView2.hideSkeleton()
        fromLabel2.hideSkeleton()
        fromPlace2.hideSkeleton()
        toLabel2.hideSkeleton()
        toPlace2.hideSkeleton()
        noOfSeatsLabel2.hideSkeleton()
        noOfSeatsValue2.hideSkeleton()
        dateAndTime2.hideSkeleton()
        
    }

}   // #72
