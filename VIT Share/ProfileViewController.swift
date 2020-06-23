//
//  ProfileViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Outlets
    @IBOutlet var profileImage: UIImageView!
    
    func ProfileImageProp() {
        
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0).cgColor
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileImageProp()

    }

}   // #33
