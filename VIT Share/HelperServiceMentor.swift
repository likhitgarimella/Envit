//
//  HelperServiceMentor.swift
//  VIT Share
//
//  Created by Likhit Garimella on 11/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class HelperServiceMentor {
    
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
        
        newPostReference.setValue(["uid": currentUserId, "2) Domain": domainText, "3) Experience": experienceText, "4) Prerequisites": prerequisitesText, "5) Courses": coursesText, "6) Timestamp": timestamp], withCompletionBlock: { (error, ref) in
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
    
}   // #44
