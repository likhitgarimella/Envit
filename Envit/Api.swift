//
//  Api.swift
//  Envit
//
//  Created by Likhit Garimella on 18/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

// Place to store all Apis

struct Api {
    
    // MARK:- User
    
    /// Firebase node - Users
    static var UserDet = UserApi()
    
    
    // MARK:- Mentee
    
    /// Firebase node - Mentees-Details
    static var MenteePost = MenteePostApi()
    /// Firebase node - Comments-In-Mentee-Post
    static var MenteeComment = MenteeCommentApi()
    /// Firebase node - Mentee-Post-Comments
    static var MenteePostComment = MenteePostCommentApi()
    
    
    // MARK:- Mentor
    
    /// Firebase node - Mentors-Details
    static var MentorPost = MentorPostApi()
    /// Firebase node - Comments-In-Mentor-Post
    static var MentorComment = MentorCommentApi()
    /// Firebase node - Mentor-Post-Comments
    static var MentorPostComment = MentorPostCommentApi()
    
    
    // MARK:- Personal Project
    
    /// Firebase node - Personal Projects-Details
    static var PersonalProjectPost = PersonalProjectPostApi()
    /// Firebase node - Comments-In-Pers-Projects
    static var PersProjComment = PersProjCommentApi()
    /// Firebase node - Pers-Proj-Post-Comments
    static var PersProjPostComment = PersProjPostCommentApi()
    
    
    // MARK:- J component
    
    /// Firebase node - J-Component Projects-Details
    static var JComponentProjectPost = JComponentProjectPostApi()
    /// Firebase node - Comments-In-JComp-Projects
    static var JCompProjComment = JCompProjCommentApi()
    /// Firebase node - JComp-Proj-Post-Comments
    static var JCompProjPostComment = JCompProjPostCommentApi()
    
    
    // MARK:- Profile
    
    /// Firebase node - My-Mentor-Posts
    static var MyMentorPosts = MyMentorPostsApi()
    /// Firebase node - My-Mentee-Posts
    static var MyMenteePosts = MyMenteePostsApi()
    /// Firebase node - My-Pers-Projects
    static var MyPersProjPosts = MyPersProjApi()
    /// Firebase node - My-Jcomp-Projects
    static var MyJcompProjPosts = MyJCompProjApi()
    
    /// Firebase node - My-Wall-Posts
    static var MyPosts = MyPostsApi()
    
    
    // MARK:- Share on wall
    
    /// Firebase node - Posts-Details
    static var Post = PostApi()
    /// Firebase node - Comments-On-Wall
    static var Comment = CommentApi()
    /// Firebase node - Wall-Post-Comments
    static var PostComment = PostCommentApi()
    
}   // #86
