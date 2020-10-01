//
//  MentorPostCommentApi.swift
//  Envit
//
//  Created by Likhit Garimella on 21/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class MentorPostCommentApi {
    
    var REF_POST_COMMENTS = Database.database().reference().child("Mentor-Post-Comments")
    
    func observePostComments(withPostId id: String) {
        
        
        
    }
    
}   // #25
