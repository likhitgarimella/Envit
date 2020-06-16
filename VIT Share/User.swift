//
//  User.swift
//  VIT Share
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class User {
    
    var nameString: String?
    var emailString: String?
    var phoneString: String?
    var blockString: String?
    
}

extension User {
    
    static func transformUser(dict: [String: Any]) -> User {
        
        let user = User()
        user.nameString = dict["1) Name"] as? String
        user.emailString = dict["2) Email"] as? String
        user.phoneString = dict["1) Phone"] as? String
        user.blockString = dict["2) Block"] as? String
        return user
        
    }
    
}   // #34
