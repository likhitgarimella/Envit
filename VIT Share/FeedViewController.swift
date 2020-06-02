//
//  FeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // Outlets
    @IBOutlet var mentorSwitch: UISwitch!
    @IBOutlet var menteeSwitch: UISwitch!
    
    // universal collection view
    @IBOutlet var feedCollectionView: UICollectionView!
    
    // switch properties
    func Switch() {
        
        mentorSwitch.isOn = true
        menteeSwitch.isOn = false
        
    }
    
    @IBAction func enableMentor(_ sender: UISwitch) {
        
        menteeSwitch.setOn(!sender.isOn, animated: true)
        
    }
    
    @IBAction func enableMentee(_ sender: UISwitch) {
        
        mentorSwitch.setOn(!sender.isOn, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Switch()
        
    }
    
}   // #48
