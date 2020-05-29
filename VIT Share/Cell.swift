//
//  Cell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 16/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var fromPlace: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var toPlace: UILabel!
    @IBOutlet var noOfSeatsLabel: UILabel!
    @IBOutlet var noOfSeatsValue: UILabel!
    @IBOutlet var dateAndTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
    }

}   // #35
