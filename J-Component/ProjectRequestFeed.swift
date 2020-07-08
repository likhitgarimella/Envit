//
//  ProjectRequestFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 27/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ProjectRequestFeed: UIViewController {
    
    // Outlets
    @IBOutlet var addCourseOutlet: UIButton!
    
    func AddCourseBtnProp() {
        
        addCourseOutlet.layer.cornerRadius = 22
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddCourseBtnProp()
        
    }
    
}   // #30
