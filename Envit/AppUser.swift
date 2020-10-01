//
//  AppUser.swift
//  Envit
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class AppUser {
    
    var nameString: String?
    var emailString: String?
    var phoneString: String?
    var blockString: String?
    
    var id: String?
    
}

extension AppUser {
    
    static func transformUser(dict: [String: Any], key: String) -> AppUser {
        
        let user = AppUser()
        user.nameString = dict["1) Name"] as? String
        user.emailString = dict["2) Email"] as? String
        user.phoneString = dict["3) Phone"] as? String
        user.blockString = dict["4) Block"] as? String
        
        user.id = key
        return user
        
    }
    
}   // #38
