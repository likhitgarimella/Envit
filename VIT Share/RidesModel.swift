//
//  RidesModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 21/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class RidesModel {
    
    var id: String?
    var from: String?
    var to: String?
    var seats: String?
    var dateTime: String?
    
    init(id: String?, from: String?, to: String?, seats: String?, dateTime: String?) {
        self.id = id
        self.from = from
        self.to = to
        self.seats = seats
        self.dateTime = dateTime
    }
    
}   // #28
