//
//  ModifyBooksViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 15/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ModifyBooksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Collection View
    @IBOutlet var cardCollectionView2: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Registering cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! Cell4
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register CollectionViewCell 'Cell4' here
        cardCollectionView2.register(UINib.init(nibName: "Cell4", bundle: nil), forCellWithReuseIdentifier: "Cell4")
        if let flowLayout = cardCollectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
    }

}   // #43
