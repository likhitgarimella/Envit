//
//  FindJComponentViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 26/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FindJComponentViewController: UIViewController {
    
    // Outlets
    @IBOutlet var jcOutlet: UIButton!
    @IBOutlet var prRequest: UIButton!
    
    // Container Views
    @IBOutlet var jcFeed: UIView!
    @IBOutlet var jcRequest: UIView!
    
    func Default() {
        
        jcOutlet.backgroundColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0) /// red
        jcOutlet.setTitleColor(UIColor.white, for: .normal)
        prRequest.backgroundColor = UIColor(red: 220/255, green: 231/255, blue: 255/255, alpha: 1.0) /// blue
        prRequest.setTitleColor(UIColor(red: 101/255, green: 119/255, blue: 157/255, alpha: 1.0), for: .normal)
        
    }
    
    func GeneralProp() {
        
        jcOutlet.layer.cornerRadius = 15
        prRequest.layer.cornerRadius = 15
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        Default()
        GeneralProp()
        
    }
    
    @IBAction func jcAction(_ sender: UIButton) {
        
        jcOutlet.backgroundColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0) /// red
        jcOutlet.setTitleColor(UIColor.white, for: .normal)
        prRequest.backgroundColor = UIColor(red: 220/255, green: 231/255, blue: 255/255, alpha: 1.0) /// blue
        prRequest.setTitleColor(UIColor(red: 101/255, green: 119/255, blue: 157/255, alpha: 1.0), for: .normal)
        jcFeed.alpha = 1
        jcRequest.alpha = 0
        
    }
    
    @IBAction func prAction(_ sender: UIButton) {
        
        prRequest.backgroundColor = UIColor(red: 255/255, green: 119/255, blue: 119/255, alpha: 1.0) /// red
        prRequest.setTitleColor(UIColor.white, for: .normal)
        jcOutlet.backgroundColor = UIColor(red: 220/255, green: 231/255, blue: 255/255, alpha: 1.0) /// blue
        jcOutlet.setTitleColor(UIColor(red: 101/255, green: 119/255, blue: 157/255, alpha: 1.0), for: .normal)
        jcFeed.alpha = 0
        jcRequest.alpha = 1
        
    }
    
}   // #72
