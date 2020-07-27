//
//  PostCommentApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 27/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class PostCommentApi {
    
    var REF_POST_COMMENTS = Database.database().reference().child("Wall-Post-Comments")
    
    func observePostComments(withPostId id: String) {
        
        
        
    }
    
}   // #25
