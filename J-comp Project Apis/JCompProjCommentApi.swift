//
//  JCompProjCommentApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 30/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class JCompProjCommentApi {
    
    var REF_COMMENTS = Database.database().reference().child("Comments-In-JComp-Projects")
    
    func observeComments(withPostId id: String, completion: @escaping (JCompProjectComments) -> Void) {
        
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newComment = JCompProjectComments.transformComment(dict: dict)
                completion(newComment)
            }
            
        })
        
    }
    
}   // #32
