//
//  CommentApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 27/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class CommentApi {
    
    var REF_COMMENTS = Database.database().reference().child("Comments-On-Wall")
    
    func observeComments(withPostId id: String, completion: @escaping (Comment) -> Void) {
        
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newComment = Comment.transformComment(dict: dict)
                completion(newComment)
            }
            
        })
        
    }
    
}   // #32
