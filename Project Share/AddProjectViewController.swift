//
//  AddProjectViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 25/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    // Switch Outlets
    @IBOutlet var personalProjectSwitch: UISwitch!
    @IBOutlet var jComponentSwitch: UISwitch!
    
    // Container Views
    @IBOutlet var personalProjectPost: UIView!
    @IBOutlet var jComponentPost: UIView!
    
    // switch properties
    func Switch() {
        
        personalProjectSwitch.isOn = true
        jComponentSwitch.isOn = false
        
    }
    
    // 1st switch action
    @IBAction func enablePersonalProject(_ sender: UISwitch) {
        
        jComponentSwitch.setOn(!sender.isOn, animated: true)
        
        if personalProjectSwitch.isOn == true {
            personalProjectPost.alpha = 1
            jComponentPost.alpha = 0
        }
        
        if jComponentSwitch.isOn == true {
            jComponentPost.alpha = 1
            personalProjectPost.alpha = 0
        }
        
    }
    
    // 2nd switch action
    @IBAction func enableJComponent(_ sender: UISwitch) {
        
        personalProjectSwitch.setOn(!sender.isOn, animated: true)
        
        if personalProjectSwitch.isOn == true {
            personalProjectPost.alpha = 1
            jComponentPost.alpha = 0
        }
        
        if jComponentSwitch.isOn == true {
            jComponentPost.alpha = 1
            personalProjectPost.alpha = 0
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        Switch()
        hideKeyboardWhenTappedAround()
        
    }
    
}   // #75
