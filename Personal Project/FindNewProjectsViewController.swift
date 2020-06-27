//
//  FindNewProjectsViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FindNewProjectsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var persProj: UIButton!
    
    func GeneralProp() {
        
        persProj.layer.cornerRadius = 15
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        GeneralProp()
        
    }
    
}   // #34
