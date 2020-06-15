//
//  CommentsInMenteePostFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class CommentsInMenteePostFeed: UIViewController {
    
    @IBOutlet var commentsInMenteePostFeedTableView: UITableView!
    
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var sendOutlet: UIButton!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    func Properties() {
        
        commentsInMenteePostFeedTableView.backgroundColor = UIColor.white
        commentsInMenteePostFeedTableView.estimatedRowHeight = 80
        commentsInMenteePostFeedTableView.rowHeight = UITableView.automaticDimension
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Properties()
        
    }
    
}

extension CommentsInMenteePostFeed: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell1", for: indexPath) as! CommentsInMenteeTableViewCell
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}   // #50
