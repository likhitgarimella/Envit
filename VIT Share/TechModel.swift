//
//  TechModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class TechModel {
    
    var id: String?
    var domain: String?
    var experienceTextView: String?
    var prerequisites: String?
    var courses: String?
    var timestamp: Double?
    
    init(id: String?, domain: String?, experienceTextView: String?, prerequisites: String?, courses: String?, timestamp: Double?) {
        self.id = id
        self.domain = domain
        self.experienceTextView = experienceTextView
        self.prerequisites = prerequisites
        self.courses = courses
        self.timestamp = timestamp
    }
    
}   // #30
