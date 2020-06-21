//
//  MenteePostCommentApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 18/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class MenteePostCommentApi {
    
    var REF_POST_COMMENTS = Database.database().reference().child("Mentee-Post-Comments")
    
    func observePostComments(withPostId id: String) {
        
        
        
    }
    
}   // #25
