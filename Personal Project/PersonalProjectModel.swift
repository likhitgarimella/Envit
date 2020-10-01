//
//  PersonalProjectModel.swift
//  Envit
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseAuth

class PersonalProjectModel {
    
    ///
    var projectTitle: String?
    var role: String?
    var projDesc: String?
    ///
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
    ///
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    
    var isLiked: Bool?
    
}

extension PersonalProjectModel {
    
    static func transformPersProjPost(dict: [String: Any], key: String) -> PersonalProjectModel {
        
        let persProjPost = PersonalProjectModel()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        persProjPost.id = key
        persProjPost.projectTitle = dict["1) Title"] as? String
        persProjPost.role = dict["2) Role"] as? String
        persProjPost.projDesc = dict["3) Description"] as? String
        persProjPost.uid = dict["5) uid"] as? String
        
        persProjPost.likeCount = dict["likeCount"] as? Int
        persProjPost.likes = dict["likes"] as? Dictionary<String, Any>
        
        if let currentUserId = Auth.auth().currentUser?.uid {
            if persProjPost.likes != nil {
                /* if post.likes[currentUserId] != nil {
                    post.isLiked = true
                } else {
                    post.isLiked = false
                } */
                /// Above commented snippet can be put in 1 line.. as below..
                persProjPost.isLiked = persProjPost.likes![currentUserId] != nil
            }
        }
        
        return persProjPost
        
    }
    
}   // #64
