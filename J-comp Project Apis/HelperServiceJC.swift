//
//  HelperServiceJC.swift
//  Envit
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class HelperServiceJC {
    
    static func uploadDataToServer(titleText: String, courseText: String, descText: String, onSuccess: @escaping () -> Void) {
        
        self.sendDataToDatabase(titleText: titleText, courseText: courseText, descText: descText, onSuccess: onSuccess)
        
    }
    
    static func sendDataToDatabase(titleText: String, courseText: String, descText: String, onSuccess: @escaping () -> Void) {
        let newPostId = Api.JComponentProjectPost.REF_POSTS.childByAutoId().key
        let newPostReference = Api.JComponentProjectPost.REF_POSTS.child(newPostId!)
        guard let currentUser = Api.UserDet.CURRENT_USER else {
            return
        }
        let currentUserId = currentUser.uid
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        // put that download url string in db
        
        newPostReference.setValue(["1) Title": titleText, "2) Course": courseText, "3) Description": descText, "4) Timestamp": timestamp, "5) uid": currentUserId], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            // reference for my posts
            let myPostRef = Api.MyJcompProjPosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
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
