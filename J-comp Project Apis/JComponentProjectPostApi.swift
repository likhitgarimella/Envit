//
//  JComponentProjectPostApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class JComponentProjectPostApi {
    
    var REF_JCOMP_PROJ_POSTS = Database.database().reference().child("J-Component Projects").child("Details")
    
    func observePosts(completion: @escaping (JComponentProjectModel) -> Void) {
        
        REF_JCOMP_PROJ_POSTS.observe(.childAdded, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newPost = JComponentProjectModel.transformJCompProjPost(dict: dict, key: snapshot.key)
                completion(newPost)
            }
            
        })
        
    }
    
}   // #32
