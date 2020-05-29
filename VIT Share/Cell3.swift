//
//  Cell3.swift
//  VIT Share
//
//  Created by Likhit Garimella on 19/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class Cell3: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookDescription: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var conditionValue: UILabel!
    @IBOutlet var price: UILabel!
    
    @IBOutlet var timeAgo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
    }

}   // #35
