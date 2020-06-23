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
    @IBOutlet var userInfo: UIView!
    @IBOutlet var editProfileOutlet: UIButton!
    @IBOutlet var myPostsOutlet: UIButton!
    @IBOutlet var notificationsOutlet: UIButton!
    @IBOutlet var developersOutlet: UIButton!
    
    func ProfileImageProp() {
        
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0).cgColor
        
    }
    
    func UserInfoUIViewProp() {
        
        userInfo.layer.cornerRadius = 10
        
    }
    
    func FourButtonsProperties() {
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav bar title
        title = "Profile"
        
        ProfileImageProp()
        UserInfoUIViewProp()
        FourButtonsProperties()

    }
    
    @IBAction func editProfileAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToEditProfile", sender: self)
        
    }
    
    @IBAction func myPostsAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMyPosts", sender: self)
        
    }
    
    @IBAction func notificationsAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToNotifications", sender: self)
        
    }
    
    @IBAction func developersAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToDevelopers", sender: self)
        
    }
    
}   // #79
