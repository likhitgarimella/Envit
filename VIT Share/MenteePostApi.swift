//
//  PostApi.swift
//  Swiftagram
//
//  Created by Likhit Garimella on 17/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class MenteePostApi {
    
    var REF_POSTS = Database.database().reference().child("Mentees").child("Details")
    
    func observePosts(completion: @escaping (MenteeModel) -> Void) {
        
        REF_POSTS.observe(.childAdded, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newPost = MenteeModel.transformMenteePost(dict: dict, key: snapshot.key)
                completion(newPost)
            }
            
        })
        
    }
    
}   // #32
