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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
}   // #34
