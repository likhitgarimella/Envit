//
//  FacultyViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class FacultyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var facultyTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacultyCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func Properties() {
        
        facultyTableView.backgroundColor = UIColor.white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Properties()

    }

}   // #39
