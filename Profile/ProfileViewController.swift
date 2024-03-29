//
//  ProfileViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Outlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userInfo: UIView!
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    @IBOutlet var hostelLabel: UILabel!
    @IBOutlet var blockLabel: UILabel!
    
    @IBOutlet var fourCellsView: UIView!
    @IBOutlet var editProfileOutlet: UIButton!
    @IBOutlet var myPostsOutlet: UIButton!
    @IBOutlet var notificationsOutlet: UIButton!
    @IBOutlet var developersOutlet: UIButton!
    
    @IBOutlet var logoutOutlet: UIButton!
    
    var user: AppUser? {
        didSet {
            updateView()
        }
    }
    
    func ProfileImageProp() {
        
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0).cgColor
        
    }
    
    func UIViewProp() {
        
        userInfo.layer.cornerRadius = 10
        fourCellsView.layer.cornerRadius = 10
        
    }
    
    func fetchUser() {
        
        /// observeCurrentUser
        Api.UserDet.observeCurrentUser { (user) in
            self.user = user
        }
        
    }
    
    func updateView() {
        
        self.nameLabel.text = user!.nameString
        self.emailLabel.text = user!.emailString
        self.mobileLabel.text = user!.phoneString
        
    }
    
    func LogoutButtonProp() {
        
        logoutOutlet.layer.cornerRadius = 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav bar title
        // title = "Profile"
        
        ProfileImageProp()
        UIViewProp()
        LogoutButtonProp()
        
        fetchUser()
        
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
    
    /// Logout functionality
    @IBAction func logoutAction(_ sender: UIButton) {
        
        /// using AuthService class
        AuthService.logout(onSuccess: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(signInVC, animated: true, completion: nil)
        }, onError: {
            (errorMessage) in
            /// implement hud here
            print(errorMessage)
        })
        
    }
    
}   // #134
