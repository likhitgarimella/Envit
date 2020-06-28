//
//  PersProjPostCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class PersProjPostCell: UICollectionViewCell {
    
    // linking pers proj feed VC & pers proj post cell
    var persProjFeedVC: FindNewProjectsViewController?
    
    // db ref
    var persProjectsRef: DatabaseReference!
    
    var persProjPost: PersonalProjectModel? {
        didSet {
            
        }
    }
    
    /// when this user property is set..
    /// we'll let the cell download the correspoding cell..
    var user: User? {
        didSet {
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

}   // #42
