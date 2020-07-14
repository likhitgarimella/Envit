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
    static var UserDet = UserApi()
    
    /// Firebase node - Mentees-Details
    static var MenteePost = MenteePostApi()
    /// Firebase node - Comments-In-Mentee-Post
    static var MenteeComment = MenteeCommentApi()
    /// Firebase node - Mentee-Post-Comments
    static var MenteePostComment = MenteePostCommentApi()
    
    /// Firebase node - Mentors-Details
    static var MentorPost = MentorPostApi()
    /// Firebase node - Comments-In-Mentor-Post
    static var MentorComment = MentorCommentApi()
    /// Firebase node - Mentor-Post-Comments
    static var MentorPostComment = MentorPostCommentApi()
    
    
    /// Firebase node - Personal Projects-Details
    static var PersonalProjectPost = PersonalProjectPostApi()
    /// Firebase node - Comments-In-Pers-Projects
    static var PersProjComment = PersProjCommentApi()
    /// Firebase node - Pers-Proj-Post-Comments
    static var PersProjPostComment = PersProjPostCommentApi()
    
    /// Firebase node - J-Component Projects-Details
    static var JComponentProjectPost = JComponentProjectPostApi()
    /// Firebase node - Comments-In-JComp-Projects
    static var JCompProjComment = JCompProjCommentApi()
    /// Firebase node - JComp-Proj-Post-Comments
    static var JCompProjPostComment = JCompProjPostCommentApi()
    
    
    ///
    static var MyMentorPosts = MyMentorPostsApi()
    ///
    static var MyMenteePosts = MyMenteePostsApi()
    
    
    /// Firebase node - Posts-Details
    static var Post = PostApi()
    
}   // #58
