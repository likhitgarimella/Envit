//
//  UserApi.swift
//  Swiftagram
//
//  Created by Likhit Garimella on 17/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

/// Write your own Api, to conveniently observe database data...

class UserApi {
    
    var REF_USERS = Database.database().reference().child("Users")
    
    func obersveUser(withId uid: String, completion: @escaping (AppUser) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String:Any] {
                let user = AppUser.transformUser(dict: dict, key: snapshot.key)
                completion(user)
            }
            
        })
        
    }
    
    ///
    func observeCurrentUser(completion: @escaping (AppUser) -> Void) {
        
        guard let currentUser = Auth.auth().currentUser else {
             return
        }
        
        REF_USERS.child(currentUser.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String:Any] {
                let user = AppUser.transformUser(dict: dict, key: snapshot.key)
                completion(user)
            }
            
        })
        
    }
    
    func observeUsers(completion: @escaping (AppUser) -> Void) {
        
        REF_USERS.observe(.childAdded, with: {
            snapshot in
            
            if let dict = snapshot.value as? [String:Any] {
                let user = AppUser.transformUser(dict: dict, key: snapshot.key)
                completion(user)
            }
            
        })
        
    }
    
    ///
    var CURRENT_USER: User? {
        if let currentUser = Auth.auth().currentUser {
            return currentUser
        }
        return nil
    }
    
    var REF_CURRENT_USER: DatabaseReference? {
        
        guard let currentUser = Auth.auth().currentUser else {
             return nil
        }
        
        return REF_USERS.child(currentUser.uid)
        
    }
    
}   // #82
