//
//  Extensions.swift
//  Envit
//
//  Created by Likhit Garimella on 20/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class Extensions: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

// Button hover
extension UIButton {
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.5
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
    
}

// Date timestamp
extension Date {
    
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        let year = 12 * month
        
        if secondsAgo < minute {
            if secondsAgo == 1 {
                return "\(secondsAgo) second ago"
            }
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            if (secondsAgo / minute) == 1 {
                return "\(secondsAgo / minute) minute ago"
            }
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            if (secondsAgo / hour) == 1 {
                return "\(secondsAgo / hour) hour ago"
            }
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            if (secondsAgo / day) == 1 {
                return "\(secondsAgo / day) day ago"
            }
            return "\(secondsAgo / day) days ago"
        } else if secondsAgo < month {
            if (secondsAgo / week) == 1 {
                return "\(secondsAgo / week) week ago"
            }
            return "\(secondsAgo / week) weeks ago"
        } else if secondsAgo < year {
            if (secondsAgo / month) == 1 {
                return "\(secondsAgo / month) month ago"
            }
            return "\(secondsAgo / month) months ago"
        }
        return "\(secondsAgo / year) years ago"
    }
    
}   // #98
