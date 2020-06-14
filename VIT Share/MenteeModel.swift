//
//  MenteeModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class MenteeModel {
    
    var id: String?
    var domainText: String?
    var postQueryText: String?
    var timestamp: Double?
    
    init(id: String?, domainText: String?, postQueryText: String?, timestamp: Double?) {
        self.id = id
        self.domainText = domainText
        self.postQueryText = postQueryText
        self.timestamp = timestamp
    }
    
}   // #26
