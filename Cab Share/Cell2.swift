//
//  Cell2.swift
//  VIT Share
//
//  Created by Likhit Garimella on 20/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

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
    
    @IBOutlet var timeAgo2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView2.layer.cornerRadius = 10
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint2.constant = screenWidth - (2 * 12)
        
        setupViews()
        
    }
    
    // Edit button
    let editButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 112, width: 32, height: 32))
        let btnImage = UIImage(named: "pen")
        button.setImage(btnImage, for: .normal)
        return button
    }()
    
    // Delete button
    let deleteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 336, y: 112, width: 28, height: 32))
        let btnImage = UIImage(named: "delete")
        button.setImage(btnImage, for: .normal)
        return button
    }()

    // Add buttons to view
    func setupViews()
    {
        addSubview(editButton)
        addSubview(deleteButton)
    }

}   // #62
