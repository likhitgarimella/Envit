//
//  FeedViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 01/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "MentorPostCell", for: indexPath) as! MentorPostCell
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Switch()
        
        // Register CollectionViewCell 'MentorPostCell' here
        feedCollectionView.register(UINib.init(nibName: "MentorPostCell", bundle: nil), forCellWithReuseIdentifier: "MentorPostCell")
        if let flowLayout = feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
    }
    
}   // #63
