//
//  JCompProjPostCommentApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 30/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class JCompProjPostCommentApi {
    
    var REF_POST_COMMENTS = Database.database().reference().child("JComp-Proj-Post-Comments")
    
    func observePostComments(withPostId id: String) {
        
        
        
    }
    
}   // #25
