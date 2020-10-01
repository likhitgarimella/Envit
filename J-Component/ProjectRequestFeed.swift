//
//  ProjectRequestFeed.swift
//  Envit
//
//  Created by Likhit Garimella on 27/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ProjectRequestFeed: UIViewController {
    
    // Outlets
    @IBOutlet var addCourseOutlet: UIButton!
    
    func AddCourseBtnProp() {
        
        addCourseOutlet.layer.cornerRadius = 22
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddCourseBtnProp()
        
    }
    
    @IBAction func addCourseAction(_ sender: UIButton) {
        
        /// Alert
        let alertController = UIAlertController(title: "Enter course title", message: "", preferredStyle: .alert)
        /// Add textfield
        alertController.addTextField(configurationHandler: courseFunc(textField:))
        
        /// Ok action
        let okAction = UIAlertAction(title: "Add course", style: .default) { (_) in
            
        }
        /// Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
        }
        
        /// AlertView font
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "SFProRounded-Medium", size: 18.0)!]
        let titleAttrString = NSMutableAttributedString(string: "Enter course title", attributes: titleFont)
        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        
        /// Adding Ok action
        alertController.addAction(okAction)
        /// Adding Cancel action
        alertController.addAction(cancelAction)
        /// Present alert controller
        present(alertController, animated: true, completion: nil)
        
    }
    
    /// Textfield prop
    func courseFunc(textField: UITextField!) {
        let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 32)
        textField.addConstraint(heightConstraint)
        textField.minimumFontSize = 18
        textField.font = UIFont(name: "SFProRounded-Regular", size: 16.0)
    }
    
}   // #68
