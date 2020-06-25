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
    
    func AddProjectBtnProp() {
        
        addProjectOutlet.layer.cornerRadius = 10
        addProjectOutlet.layer.borderWidth = 2.5
        addProjectOutlet.layer.borderColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0).cgColor
        
    }
    
    func OtherBtnProp() {
        
        newProjectsOutlet.layer.cornerRadius = 10
        jComponentOutlet.layer.cornerRadius = 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddProjectBtnProp()
        OtherBtnProp()
        
    }
    
    @IBAction func addProjectAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToAddProject", sender: self)
        
    }
    
}   // #48
