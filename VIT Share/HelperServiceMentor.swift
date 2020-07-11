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
        // put that download url string in db
        newPostReference.setValue(["uid": currentUserId, "photoUrl": photoUrl, "caption": caption], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            Api.Feed.REF_FEED.child(Api.UserDet.CURRENT_USER!.uid).child(newPostId!).setValue(true)
            // Database.database().reference().child("feed").child(Api.UserDet.CURRENT_USER!.uid).child(newPostId!).setValue(true)
            
            // reference for my posts
            let myPostRef = Api.MyPosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
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
