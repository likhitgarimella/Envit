//
//  CommentApi.swift
//  Swiftagram
//
//  Created by Likhit Garimella on 18/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class MenteeCommentApi {
    
    var REF_COMMENTS = Database.database().reference().child("Comments-In-Mentee-Post")
    
    func observeComments(withPostId id: String, completion: @escaping (MenteeComments) -> Void) {
        
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newComment = MenteeComments.transformComment(dict: dict)
                completion(newComment)
            }
            
        })
        
    }
    
}   // #32
