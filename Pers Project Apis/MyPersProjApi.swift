//
//  MyPersProjApi.swift
//  Envit
//
//  Created by Likhit Garimella on 13/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

import FirebaseDatabase

/// Write your own Api, to conveniently observe database data...

class MyPersProjApi {
    
    var REF_MYPOSTS = Database.database().reference().child("My-Pers-Projects")

}   // #20
