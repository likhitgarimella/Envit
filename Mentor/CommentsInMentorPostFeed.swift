//
//  CommentsInMentorPostFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentsInMentorPostFeed: UIViewController {
    
    @IBOutlet var commentsInMentorPostFeedTableView: UITableView!
    
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var sendOutlet: UIButton!
    
    // image on send button
    @IBOutlet var sendImage: UIImageView!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    // dummy post id taken for example
    // let postId = "-M9o5UApAuGFRj8zHH14"
    
    // Initialise empty string
    var postId: String!
    
    var mentorComments = [MentorComments]()
    var users = [User]()
    
    // Tab bar disappears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // Tab bar appears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
}   // #55
