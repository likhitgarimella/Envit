//
//  ProjectsShareViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 31/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ProjectsShareViewController: UIViewController {
    
    // Outlets
    @IBOutlet var addProjectOutlet: UIButton!
    @IBOutlet var newProjectsOutlet: UIButton!
    @IBOutlet var jComponentOutlet: UIButton!
    
    func ButtonsProp() {
        
        addProjectOutlet.layer.cornerRadius = 22
        newProjectsOutlet.layer.cornerRadius = 10
        jComponentOutlet.layer.cornerRadius = 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonsProp()
        
    }
    
    @IBAction func addProjectAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToAddProject", sender: self)
        
    }
    
    @IBAction func findNewProjectsAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToFindNewProjects", sender: self)
        
    }
    
    @IBAction func findJComponentAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToFindJComponent", sender: self)
        
    }
    
}   // #52
