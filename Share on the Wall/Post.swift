//
//  Post.swift
//  Envit
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseAuth

class Post {
    
    var caption: String?
    var photoUrl: String?
    var frameColor: String?
    var categoryLabel: String?
    
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    
    var isLiked: Bool?
    
}

extension Post {
    
    // Photo
    static func transformPostPhoto(dict: [String: Any], key: String) -> Post {
        
        let post = Post()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        post.id = key
        post.frameColor = dict["frameColor"] as? String
        post.categoryLabel = dict["categoryLabel"] as? String
        post.caption = dict["caption"] as? String
        post.photoUrl = dict["photoUrl"] as? String
        post.uid = dict["uid"] as? String
        
        post.likeCount = dict["likeCount"] as? Int
        post.likes = dict["likes"] as? Dictionary<String, Any>
        
        if let currentUserId = Auth.auth().currentUser?.uid {
            if post.likes != nil {
                /* if post.likes[currentUserId] != nil {
                    post.isLiked = true
                } else {
                    post.isLiked = false
                } */
                /// Above commented snippet can be put in 1 line.. as below..
                post.isLiked = post.likes![currentUserId] != nil
            }
        }
        
        return post
        
    }
    
    // Video
    static func transformPostVideo() {
        
        
        
    }
    
}   // #72
