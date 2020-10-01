//
//  MenteeModel.swift
//  Envit
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseAuth

class MenteeModel {
    
    ///
    var domainText: String?
    var postQueryText: String?
    ///
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
    ///
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    
    var isLiked: Bool?
    
    /*
    init(id: String?, domainText: String?, postQueryText: String?, timestamp: Double?) {
        self.id = id
        self.domainText = domainText
        self.postQueryText = postQueryText
        self.timestamp = timestamp
    }   */
    
}

extension MenteeModel {
    
    static func transformMenteePost(dict: [String: Any], key: String) -> MenteeModel {
        
        let menteePost = MenteeModel()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        menteePost.id = key
        menteePost.domainText = dict["1) Domain"] as? String
        menteePost.postQueryText = dict["2) Query"] as? String
        menteePost.uid = dict["4) uid"] as? String
        
        menteePost.likeCount = dict["likeCount"] as? Int
        menteePost.likes = dict["likes"] as? Dictionary<String, Any>
        
        if let currentUserId = Auth.auth().currentUser?.uid {
            if menteePost.likes != nil {
                /* if post.likes[currentUserId] != nil {
                    post.isLiked = true
                } else {
                    post.isLiked = false
                } */
                /// Above commented snippet can be put in 1 line.. as below..
                menteePost.isLiked = menteePost.likes![currentUserId] != nil
            }
        }
        
        return menteePost
        
    }
    
}   // #70
