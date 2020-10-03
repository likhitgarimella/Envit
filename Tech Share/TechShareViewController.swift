//
//  TechShareViewController.swift
//  Envit
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
        
        goToFeedOutlet.layer.cornerRadius = 18
        mentorOutlet.layer.cornerRadius = 10
        menteeOutlet.layer.cornerRadius = 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonsProp()
        
    }
    
    @IBAction func goToFeedAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToFeed", sender: self)
        
    }
    
    @IBAction func mentorAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMentor", sender: self)
        
    }
    
    @IBAction func menteeAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMentee", sender: self)
        
    }

}   // #52
