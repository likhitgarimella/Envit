//
//  PersonalProjectPostApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class PersonalProjectPostApi {
    
    var REF_PERS_PROJ_POSTS = Database.database().reference().child("Personal Projects").child("Details")
    
    func observePosts(completion: @escaping (PersonalProjectModel) -> Void) {
        
        REF_PERS_PROJ_POSTS.observe(.childAdded, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any] {
                let newPost = PersonalProjectModel.transformPersProjPost(dict: dict, key: snapshot.key)
                completion(newPost)
            }
            
        })
        
    }
    
}   // #32
