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
    @IBOutlet var findAMentorView: UIView!
    @IBOutlet var beAMentorView: UIView!
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
            findAMentorView.alpha = 1
            beAMentorView.alpha = 0
            modifyView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            findAMentorView.alpha = 0
            beAMentorView.alpha = 1
            modifyView.alpha = 0
        }
        if sender.selectedSegmentIndex == 2 {
            findAMentorView.alpha = 0
            beAMentorView.alpha = 0
            modifyView.alpha = 1
        }
        
    }

}   // #58
