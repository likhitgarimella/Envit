//
//  MentorPostApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 21/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class MentorPostApi {
    
    var REF_POSTS = Database.database().reference().child("Mentors").child("Details")
    
    func observePosts(completion: @escaping (MentorModel) -> Void) {
        
        REF_POSTS.observe(.childAdded, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newPost = MentorModel.transformMentorPost(dict: dict, key: snapshot.key)
                completion(newPost)
            }
            
        })
        
    }
    
}   // #32
