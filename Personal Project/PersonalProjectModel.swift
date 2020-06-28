//
//  PersonalProjectModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 28/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

class PersonalProjectModel {
    
    ///
    var projectTitle: String?
    var role: String?
    var projDesc: String?
    
    ///
    var uid: String?
    
    /// Remodel Post class, bcuz it currently doesn't have a post id property
    var id: String?
    
}

extension PersonalProjectModel {
    
    static func transformPersProjPost(dict: [String: Any], key: String) -> PersonalProjectModel {
        
        let persProjPost = PersonalProjectModel()
        /// Remodel Post class, bcuz it currently doesn't have a post id property
        persProjPost.id = key
        persProjPost.projectTitle = dict["2) Title"] as? String
        persProjPost.role = dict["3) Role"] as? String
        persProjPost.projDesc = dict["4) Description"] as? String
        persProjPost.uid = dict["6) uid"] as? String
        
        return persProjPost
        
    }
    
}   // #44
