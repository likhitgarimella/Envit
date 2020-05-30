//
//  BooksModel.swift
//  VIT Share
//
//  Created by Likhit Garimella on 19/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class BooksModel {
    
    var id: String?
    var title: String?
    var description: String?
    var condition: String?
    var price: String?
    var timestamp: Double?
    
    init(id: String?, title: String?, description: String?, condition: String?, price: String?, timestamp: Double?) {
        self.id = id
        self.title = title
        self.description = description
        self.condition = condition
        self.price = price
        self.timestamp = timestamp
    }
    
}   // #30
