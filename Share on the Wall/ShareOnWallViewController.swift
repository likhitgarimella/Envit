//
//  ShareOnWallViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 10/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ShareOnWallViewController: UIViewController {
    
    // Outlets
    @IBOutlet var photoView: UIView!
    @IBOutlet var insideView: UIView!
    @IBOutlet var selectPhotoImage: UIImageView!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    
    func Properties() {
        
        photoView.layer.cornerRadius = 10
        photoView.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        insideView.layer.cornerRadius = 5
        selectPhotoImage.image = UIImage(named: "selectPhoto")
        
        // Inital state for buttons
        buttonOne.setImage(UIImage(named: "redOn"), for: .normal)
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
    }
    
    func Conditions() {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        Properties()
        Conditions()
        
    }
    
    @IBAction func buttonOneAction(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonThreeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonFourAction(_ sender: UIButton) {
        
    }
    
}   // #70
