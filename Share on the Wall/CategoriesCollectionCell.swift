//
//  CategoriesCollectionCell.swift
//  VIT Share
//
//  Created by Likhit Garimella on 21/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

// Protocol
protocol CategoriesCollectionCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

class CategoriesCollectionCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var cellView: UIView!
    @IBOutlet var buttonOutlet: UIButton!
    
    weak var delegate: CategoriesCollectionCellDelegate?
    
    class var reuseIdentifier: String {
        return "CategoriesCollectionCell"
    }
    
    class var nibName: String {
        return "CategoriesCollectionCell"
    }
    
    private var title: String = ""
    
    func configureCell(title: String) {
        self.title = title
        self.buttonOutlet.setTitle(title, for: .normal)
    }
    
    /*
    // linking feed VC & cell
    var shareOnWallVC: ShareOnWallViewController?
    */
    
    /// We can erase all old data before a cell is reused...
    /// this method will be called right before a cell is reused...
    override func prepareForReuse() {
        super.prepareForReuse()
        
        buttonOutlet.setTitle("", for: .normal)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initial
        buttonOutlet.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
        buttonOutlet.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
        buttonOutlet.layer.cornerRadius = 15
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        delegate?.didTapButton(with: title)
        
        // print(sender.tag)
        
        // When tapped
        buttonOutlet.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
        buttonOutlet.setTitleColor(UIColor.white, for: .normal)
        
    }
    
}   // #76
