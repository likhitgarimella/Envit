//
//  Api.swift
//  VIT Share
//
//  Created by Likhit Garimella on 18/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

// Place to store all Apis

struct Api {
    
    /// Firebase node - Users
    static var User = UserApi()
    
    /// Firebase node - Mentees-Details
    static var MenteePost = MenteePostApi()
    /// Firebase node - Comments-In-Mentee-Post
    static var MenteeComment = MenteeCommentApi()
    /// Firebase node - Mentee-Post-Comments
    static var MenteePostComment = MenteePostCommentApi()
    
    /// Firebase node - Mentees-Details
    static var MentorPost = MentorPostApi()
    /// Firebase node - Comments-In-Mentee-Post
    static var MentorComment = MentorCommentApi()
    /// Firebase node - Mentee-Post-Comments
    static var MentorPostComment = MentorPostCommentApi()
    
    /// Firebase node - Personal Projects-Details
    static var PersonalProjectPost = PersonalProjectPostApi()
    /// Firebase node - J-Component Projects-Details
    static var JComponentProjectPost = JComponentProjectPostApi()
    
}   // #38
