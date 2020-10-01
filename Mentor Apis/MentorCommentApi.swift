//
//  MentorCommentApi.swift
//  Envit
//
//  Created by Likhit Garimella on 21/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class MentorCommentApi {
    
    var REF_COMMENTS = Database.database().reference().child("Comments-In-Mentor-Post")
    
    func observeComments(withPostId id: String, completion: @escaping (MentorComments) -> Void) {
        
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newComment = MentorComments.transformComment(dict: dict)
                completion(newComment)
            }
            
        })
        
    }
    
}   // #32
