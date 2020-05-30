//
//  Cell4.swift
//  VIT Share
//
//  Created by Likhit Garimella on 29/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class Cell4: UICollectionViewCell {

    // Outlets
    @IBOutlet var cardView2: UIView!
    @IBOutlet var widthConstraint2: NSLayoutConstraint!
    @IBOutlet var bookTitle2: UILabel!
    @IBOutlet var bookDescription2: UILabel!
    @IBOutlet var conditionLabel2: UILabel!
    @IBOutlet var conditionValue2: UILabel!
    @IBOutlet var price2: UILabel!
    
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
        let button = UIButton(frame: CGRect(x: 270, y: 84, width: 32, height: 32))
        let btnImage = UIImage(named: "pen")
        button.setImage(btnImage, for: .normal)
        return button
    }()
    
    // Delete button
    let deleteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 336, y: 84, width: 28, height: 32))
        let btnImage = UIImage(named: "delete")
        button.setImage(btnImage, for: .normal)
        return button
    }()

    // Add buttons to views
    func setupViews()
    {
        editButton.transform = CGAffineTransform(scaleX: 1, y: -1)
        deleteButton.transform = CGAffineTransform(scaleX: 1, y: -1)
        addSubview(editButton)
        addSubview(deleteButton)
    }

}   // #62
