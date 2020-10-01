//
//  Comment.swift
//  Envit
//
//  Created by Likhit Garimella on 28/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class Comment {
    
    var commentText: String?
    var uid: String?
    
}

extension Comment {
    
    static func transformComment(dict: [String: Any]) -> Comment {
        
        let comment = Comment()
        comment.commentText = dict["commentText"] as? String
        comment.uid = dict["uid"] as? String
        return comment
        
    }
    
}   // #30
