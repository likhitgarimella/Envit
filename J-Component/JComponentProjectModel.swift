//
//  JComponentProjectModel.swift
//  Envit
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseAuth

class JComponentProjectModel {
    
    ///
    var projectTitle: String?
    var courseTitle: String?
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

extension JComponentProjectModel {
    
    static func transformJCompProjPost(dict: [String: Any], key: String) -> JComponentProjectModel {
        
        let jcompProjPost = JComponentProjectModel()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        jcompProjPost.id = key
        jcompProjPost.projectTitle = dict["1) Title"] as? String
        jcompProjPost.courseTitle = dict["2) Course"] as? String
        jcompProjPost.projDesc = dict["3) Description"] as? String
        jcompProjPost.uid = dict["5) uid"] as? String
        
        jcompProjPost.likeCount = dict["likeCount"] as? Int
        jcompProjPost.likes = dict["likes"] as? Dictionary<String, Any>
        
        if let currentUserId = Auth.auth().currentUser?.uid {
            if jcompProjPost.likes != nil {
                /* if post.likes[currentUserId] != nil {
                    post.isLiked = true
                } else {
                    post.isLiked = false
                } */
                /// Above commented snippet can be put in 1 line.. as below..
                jcompProjPost.isLiked = jcompProjPost.likes![currentUserId] != nil
            }
        }
        
        return jcompProjPost
        
    }
    
}   // #64
