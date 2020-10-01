//
//  MentorComments.swift
//  Envit
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class MentorComments {
    
    var commentText: String?
    var uid: String?
    
}

extension MentorComments {
    
    static func transformComment(dict: [String: Any]) -> MentorComments {
        
        let comment = MentorComments()
        comment.commentText = dict["commentText"] as? String
        comment.uid = dict["uid"] as? String
        return comment
        
    }
    
}   // #30
