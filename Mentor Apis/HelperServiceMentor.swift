//
//  HelperServiceMentor.swift
//  Envit
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class HelperServiceMentor {
    
    static func uploadDataToServer(domainText: String, experienceText: String, prerequisitesText: String, coursesText: String, onSuccess: @escaping () -> Void) {
        
        self.sendDataToDatabase(domainText: domainText, experienceText: experienceText, prerequisitesText: prerequisitesText, coursesText: coursesText, onSuccess: onSuccess)
        
    }
    
    static func sendDataToDatabase(domainText: String, experienceText: String, prerequisitesText: String, coursesText: String, onSuccess: @escaping () -> Void) {
        let newPostId = Api.MentorPost.REF_POSTS.childByAutoId().key
        let newPostReference = Api.MentorPost.REF_POSTS.child(newPostId!)
        guard let currentUser = Api.UserDet.CURRENT_USER else {
            return
        }
        let currentUserId = currentUser.uid
        // Creating a timestamp
        let timestamp = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        // put that download url string in db
        
        newPostReference.setValue(["1) Domain": domainText, "2) Experience": experienceText, "3) Prerequisites": prerequisitesText, "4) Courses": coursesText, "5) Timestamp": timestamp, "6) uid": currentUserId], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            // reference for my posts
            let myPostRef = Api.MyMentorPosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
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
