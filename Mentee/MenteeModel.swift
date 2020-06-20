//
//  MenteeModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

class MenteeModel {
    
    var domainText: String?
    var postQueryText: String?
    // var videoUrl: String?
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
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
        
        menteePost.id = key
        menteePost.domainText = dict["2) Domain"] as? String
        menteePost.postQueryText = dict["3) Post Query"] as? String
        menteePost.uid = dict["5) uid"] as? String
        
        return menteePost
        
    }
    
}   // #26
