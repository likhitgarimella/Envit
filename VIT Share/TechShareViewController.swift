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
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var feedView: UIView!
    @IBOutlet var mentorView: UIView!
    @IBOutlet var menteeView: UIView!
    @IBOutlet var modifyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SegmentFontColor()
        
    }
    
    func SegmentFontColor() {
        
        // Selected option color
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
        
        // Color of other options
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        
    }
    
    // Switch Index of Segmented Control
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            feedView.alpha = 1
            mentorView.alpha = 0
            menteeView.alpha = 0
            modifyView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            feedView.alpha = 0
            mentorView.alpha = 1
            menteeView.alpha = 0
            modifyView.alpha = 0
        }
        if sender.selectedSegmentIndex == 2 {
            feedView.alpha = 0
            mentorView.alpha = 0
            menteeView.alpha = 1
            modifyView.alpha = 0
        }
        if sender.selectedSegmentIndex == 3 {
            feedView.alpha = 0
            mentorView.alpha = 0
            menteeView.alpha = 0
            modifyView.alpha = 1
        }
        
    }

}   // #68
