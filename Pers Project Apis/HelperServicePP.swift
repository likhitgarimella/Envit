//
//  HelperServicePP.swift
//  VIT Share
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class HelperServicePP {
    
    static func uploadDataToServer(titleText: String, roleText: String, descText: String, onSuccess: @escaping () -> Void) {
        
        self.sendDataToDatabase(titleText: titleText, roleText: roleText, descText: descText, onSuccess: onSuccess)
        
    }
    
    static func sendDataToDatabase(titleText: String, roleText: String, descText: String, onSuccess: @escaping () -> Void) {
        let newPostId = Api.PersonalProjectPost.REF_POSTS.childByAutoId().key
        let newPostReference = Api.PersonalProjectPost.REF_POSTS.child(newPostId!)
        guard let currentUser = Api.UserDet.CURRENT_USER else {
            return
        }
        let currentUserId = currentUser.uid
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        // put that download url string in db
        
        newPostReference.setValue(["1) Title": titleText, "2) Role": roleText, "3) Description": descText, "4) Timestamp": timestamp, "5) uid": currentUserId], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            // reference for my posts
            let myPostRef = Api.MyPersProjPosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
            myPostRef.setValue(true, withCompletionBlock: {
                (error, ref) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
            })
            onSuccess()
        })
    }
    
}   // #50
