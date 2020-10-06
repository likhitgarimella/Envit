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
    
}

extension UIColor {
    
    // Convert RGBA String to UIColor object
    // "rgbaString" must be separated by space "0.5 0.6 0.7 1.0" 50% of Red 60% of Green 70% of Blue Alpha 100%
    public convenience init? (rgbaString: String) {
        self.init(ciColor: CIColor(string: rgbaString))
    }
    
    // Convert UIColor to RGBA String
    func toRGBAString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(r) \(g) \(b) \(a)"
    }
    
    // return UIColor from Hexadecimal Color string
    public convenience init?(hexaDecimalString: String) {
        let r, g, b, a: CGFloat
        if hexaDecimalString.hasPrefix("#") {
            let start = hexaDecimalString.index(hexaDecimalString.startIndex, offsetBy: 1)
            let hexColor = hexaDecimalString.substring(from: start)
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
    // Convert UIColor to Hexadecimal String
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String (
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }

}   // #155
