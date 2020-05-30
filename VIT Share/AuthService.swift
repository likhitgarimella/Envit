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
    
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
        print("Sign in")
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
        
    }
    
    static func signUp(name: String, email: String, phone: String, block: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
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
        
        let databaseRef = Database.database().reference().child("Users").child(uid)
        // put that download url string in db
        databaseRef.setValue(["1) Name": name, "2) Email": email, "3) Phone": phone, "4) Block": block])
        onSuccess()
        
    }
    
}   // #57
