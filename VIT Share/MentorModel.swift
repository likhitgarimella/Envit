//
//  MentorModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class MentorModel {
    
    var id: String?
    var domainText: String?
    var experienceText: String?
    var prerequisitesText: String?
    var coursesText: String?
    var timestamp: Double?
    
    init(id: String?, domainText: String?, experienceText: String?, prerequisitesText: String?, coursesText: String?, timestamp: Double?) {
        self.id = id
        self.domainText = domainText
        self.experienceText = experienceText
        self.prerequisitesText = prerequisitesText
        self.coursesText = coursesText
        self.timestamp = timestamp
    }
    
}   // #30
