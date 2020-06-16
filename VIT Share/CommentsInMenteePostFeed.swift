//
//  CommentsInMenteePostFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import JGProgressHUD

class CommentsInMenteePostFeed: UIViewController {
    
    @IBOutlet var commentsInMenteePostFeedTableView: UITableView!
    
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var sendOutlet: UIButton!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    var menteeComments = [MenteeComments]()
    
    // Tab bar disappears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // Tab bar appears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func Properties() {
        
        commentsInMenteePostFeedTableView.backgroundColor = UIColor.white
        commentsInMenteePostFeedTableView.estimatedRowHeight = 80
        commentsInMenteePostFeedTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    func handleTextField() {
        
        commentTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange() {
        
        if let commentText = commentTextField.text, !commentText.isEmpty {
            sendOutlet.setTitleColor(UIColor.systemBlue, for: .normal)
            sendOutlet.isEnabled = true
            return
        }
        
        sendOutlet.setTitleColor(UIColor.lightGray, for: .normal)
        sendOutlet.isEnabled = false
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        Properties()
        empty()
        handleTextField()
        
        // Keyboard Show
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Keyboard Hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // Keyboard Show
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    // Keyboard Hide
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
    }
    
    // displaying all comments for a post
    func loadComments() {
        
        let menteePostCommentRef = Database.database().reference().child("Mentee-Post-Comments").child(self.postId)
        menteePostCommentRef.observe(.childAdded, with: {
            snapshot in
            print("snapshot key")
            print(snapshot.key)
            Database.database().reference().child("Comments-In-Mentee-Post").child(snapshot.key).observe(.value, with: {
                snapshotComment in
                print("snapshot comment")
                print(snapshotComment.value)
                if let dict = snapshotComment.value as? [String: Any] {
                    
                    let newComment = MenteeComments.transformComment(dict: dict)
                    self.fetchUser(uid: newComment.uid!, completed: {
                        self.menteeComments.append(newComment)
                        print(self.menteeComments)
                        self.commentsInMenteePostFeedTableView.reloadData()
                    })
                    
                }
            })
        })
        
    }
    
    /// it's job is to, given a user id, look up the corresponding user on db...
    func fetchUser(uid: String, completed: @escaping () -> Void) {
        
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUser(dict: dict)
                self.users.append(user)
                completed()
            }
        })
        
    }
    
    // dummy post id taken for example
    let postId = "-M9eC2A08x4T_sSkoJ79"
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        let databaseRef = Database.database().reference()
        let commentsRef = databaseRef.child("Comments-In-Mentee-Post")
        // a unique id that is generated for every comment
        let newCommentId = commentsRef.childByAutoId().key
        let newCommentReference = commentsRef.child(newCommentId!)
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        // uid of a user
        let currentUserId = currentUser.uid
        // put that string in db
        newCommentReference.setValue(["uid": currentUserId, "commentText": commentTextField.text!], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            // new node to map 'posts' & 'comments'
            let postCommentRef = databaseRef.child("Mentee-Post-Comments").child(self.postId).child(newCommentId!)
            postCommentRef.setValue(true, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
            })
            // empty and disable after a comment is posted
            self.empty()
            // hide keyboard after comment is posted
            self.view.endEditing(true)
        })
        
    }
    
    // empty and disable after a comment is posted
    func empty() {
        
        self.commentTextField.text = ""
        self.sendOutlet.isEnabled = false
        self.sendOutlet.setTitleColor(UIColor.lightGray, for: .normal)
        
    }
    
}

extension CommentsInMenteePostFeed: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell1", for: indexPath) as! CommentsInMenteeTableViewCell
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}   // #202