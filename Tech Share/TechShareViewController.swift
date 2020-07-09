//
//  TechShareViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 31/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class TechShareViewController: UIViewController {
    
    // Outlets
    @IBOutlet var goToFeedOutlet: UIButton!
    @IBOutlet var mentorOutlet: UIButton!
    @IBOutlet var menteeOutlet: UIButton!
    
    func ButtonsProp() {
        
        goToFeedOutlet.layer.cornerRadius = 22
        mentorOutlet.layer.cornerRadius = 10
        menteeOutlet.layer.cornerRadius = 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonsProp()
        
    }

}   // #24
