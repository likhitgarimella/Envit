//
//  MyPostsApi.swift
//  VIT Share
//
//  Created by Likhit Garimella on 27/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class MyPostsApi {
    
    var REF_MYPOSTS = Database.database().reference().child("My-Wall-Posts")

}   // #20
