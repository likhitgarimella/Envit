//
//  CategoriesCollectionCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 21/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cellView: UIView!
    @IBOutlet var buttonOutlet: UIButton!
    
    class var reuseIdentifier: String {
        return "CategoriesCollectionCell"
    }
    
    class var nibName: String {
        return "CategoriesCollectionCell"
    }
    
    func configureCell(name: String) {
        self.buttonOutlet.setTitle("#hashtag", for: .normal)
    }
    
    /*
    // linking feed VC & cell
    var shareOnWallVC: ShareOnWallViewController?
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}   // #40
