//
//  BooksShareViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class BooksShareViewController: UIViewController {
    
    // Outlets
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var buyView: UIView!
    @IBOutlet var postView: UIView!
    @IBOutlet var modifyBooksView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        SegmentFontColor()

    }
    
    func SegmentFontColor() {
        
        // let segAttributes: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "SF Pro Rounded", size: 14)!]
        // segment.setTitleTextAttributes(segAttributes as [NSObject : AnyObject] as? [NSAttributedString.Key : Any], for: UIControl.State.selected)
        
        // Selected option color
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
        // Color of other options
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        
    }
    
    // Switch Index of Segmented Control
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            buyView.alpha = 1
            postView.alpha = 0
            modifyBooksView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            buyView.alpha = 0
            postView.alpha = 1
            modifyBooksView.alpha = 0
        }
        if sender.selectedSegmentIndex == 2 {
            buyView.alpha = 0
            postView.alpha = 0
            modifyBooksView.alpha = 1
        }
        
    }

}   // #62
