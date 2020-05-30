//
//  AuthService.swift
//  VIT Share
//
//  Created by Likhit Garimella on 30/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static func signUp(name: String, email: String, phone: String, block: String, password: String, uid: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
        print("Sign up")
        // Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            // unique user id
            guard let uid = user?.user.uid else {
                return
            }
            self.setUserInformation(name: name, email: email, phone: phone, block: block, uid: uid, onSuccess: onSuccess)
            
        })
        
    }
    
    static func setUserInformation(name: String, email: String, phone: String, block: String, uid: String, onSuccess: @escaping () -> Void) {
        
        let databaseRef = Database.database().reference().child("users").child(uid)
        // put that download url string in db
        databaseRef.setValue(["Name": name, "Email": email, "Phone": phone, "Block": block])
        onSuccess()
        
    }
    
}   // #44
