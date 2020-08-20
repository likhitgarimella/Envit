//
//  HelperServiceMentee.swift
//  VIT Share
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class HelperServiceMentee {
    
    static func uploadDataToServer(domainText: String, queryText: String, onSuccess: @escaping () -> Void) {
        
        self.sendDataToDatabase(domainText: domainText, queryText: queryText, onSuccess: onSuccess)
        
    }
    
    static func sendDataToDatabase(domainText: String, queryText: String, onSuccess: @escaping () -> Void) {
        let newPostId = Api.MenteePost.REF_POSTS.childByAutoId().key
        let newPostReference = Api.MenteePost.REF_POSTS.child(newPostId!)
        guard let currentUser = Api.UserDet.CURRENT_USER else {
            return
        }
        let currentUserId = currentUser.uid
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        // put that download url string in db
        
        newPostReference.setValue(["1) Domain": domainText, "2) Query": queryText, "3) Timestamp": timestamp, "4) uid": currentUserId], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            // reference for my posts
            let myPostRef = Api.MyMenteePosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
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
