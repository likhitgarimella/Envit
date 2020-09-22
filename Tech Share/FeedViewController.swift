//
//  FeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // Switch Outlets
    @IBOutlet var mentorSwitch: UISwitch!
    @IBOutlet var menteeSwitch: UISwitch!
    
    // Container Views
    @IBOutlet var mentorFeedView: UIView!
    @IBOutlet var menteeFeedView: UIView!
    
    // switch properties
    func Switch() {
        
        mentorSwitch.isOn = true
        menteeSwitch.isOn = false
        
    }
    
    // 1st switch action
    @IBAction func enableMentor(_ sender: UISwitch) {
        
        menteeSwitch.setOn(!sender.isOn, animated: true)
        
        if mentorSwitch.isOn == true {
            mentorFeedView.alpha = 1
            menteeFeedView.alpha = 0
        }
        
        if menteeSwitch.isOn == true {
            menteeFeedView.alpha = 1
            mentorFeedView.alpha = 0
        }
        
    }
    
    // 2nd switch action
    @IBAction func enableMentee(_ sender: UISwitch) {
        
        mentorSwitch.setOn(!sender.isOn, animated: true)
        
        if mentorSwitch.isOn == true {
            mentorFeedView.alpha = 1
            menteeFeedView.alpha = 0
        }
        
        if menteeSwitch.isOn == true {
            menteeFeedView.alpha = 1
            mentorFeedView.alpha = 0
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
