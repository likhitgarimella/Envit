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
        self.buttonOutlet.setTitle(name, for: .normal)
    }
    
    /*
    // linking feed VC & cell
    var shareOnWallVC: ShareOnWallViewController?
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initial
        buttonOutlet.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
        buttonOutlet.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
        buttonOutlet.layer.cornerRadius = 15
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        buttonOutlet.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
        buttonOutlet.setTitleColor(UIColor.white, for: .normal)
        
    }
    
}   // #52
