//
//  MentorModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

class MentorModel {
    
    ///
    var domainText: String?
    var experienceText: String?
    var prerequisitesText: String?
    var coursesText: String?
    ///
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
    ///
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    
    var isLiked: Bool?
    
    /*
    init(id: String?, domainText: String?, experienceText: String?, prerequisitesText: String?, coursesText: String?, timestamp: Double?) {
        self.id = id
        self.domainText = domainText
        self.experienceText = experienceText
        self.prerequisitesText = prerequisitesText
        self.coursesText = coursesText
        self.timestamp = timestamp
    }   */
    
}

extension MentorModel {
    
    static func transformMentorPost(dict: [String: Any], key: String) -> MentorModel {
        
        let mentorPost = MentorModel()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        mentorPost.id = key
        mentorPost.domainText = dict["2) Domain"] as? String
        mentorPost.experienceText = dict["3) Experience"] as? String
        mentorPost.prerequisitesText = dict["4) Prerequisites"] as? String
        mentorPost.coursesText = dict["5) Courses"] as? String
        mentorPost.uid = dict["7) uid"] as? String
        
        mentorPost.likeCount = dict["likeCount"] as? Int
        mentorPost.likes = dict["likes"] as? Dictionary<String, Any>
        
        if let currentUserId = Auth.auth().currentUser?.uid {
            if mentorPost.likes != nil {
                /* if post.likes[currentUserId] != nil {
                    post.isLiked = true
                } else {
                    post.isLiked = false
                } */
                /// Above commented snippet can be put in 1 line.. as below..
                mentorPost.isLiked = mentorPost.likes![currentUserId] != nil
            }
        }
        
        return mentorPost
        
    }
    
}   // #76
