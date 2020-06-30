//
//  CommentsInJCompProjFeed.swift
//  VIT Share
//
//  Created by Likhit Garimella on 29/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentsInJCompProjFeed: UIViewController {
    
    @IBOutlet var commentsInJCompProjFeedTableView: UITableView!
    
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var sendOutlet: UIButton!
    
    // image on send button
    @IBOutlet var sendImage: UIImageView!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    // dummy post id taken for example
    // let postId = "-M9o5UApAuGFRj8zHH14"
    
    // Initialise empty string
    var postId: String!
    
    var jCompProjComments = [JCompProjectComments]()
    var users = [User]()
    
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
        
        commentsInJCompProjFeedTableView.backgroundColor = UIColor.white
        commentsInJCompProjFeedTableView.estimatedRowHeight = 80
        commentsInJCompProjFeedTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    func handleTextField() {
        
        commentTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange() {
        
        if let commentText = commentTextField.text, !commentText.isEmpty {
            sendImage.image = UIImage(named: "sendComment")
            sendOutlet.isEnabled = true
            return
        }
        
        sendImage.image = UIImage(named: "disableComment")
        sendOutlet.isEnabled = false
        
    }
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        commentTextField.layer.borderColor = myColor.cgColor
        commentTextField.layer.borderWidth = 2
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        // commentTextField.layer.cornerRadius = 20
        commentTextField.layer.cornerRadius = commentTextField.frame.size.height/2
        commentTextField.clipsToBounds = true
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfield on LEFT
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: commentTextField.frame.height))
        commentTextField.leftViewMode = .always
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        // nav bar title
        title = "Comments"
        
        hideKeyboardWhenTappedAround()
        Properties()
        empty()
        handleTextField()
        BorderProp()
        CornerRadius()
        LeftPadding()
        loadComments()
        
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
        
        // let postCommentRef = Database.database().reference().child("post-comments").child(self.postId)
        Api.JCompProjPostComment.REF_POST_COMMENTS.child(self.postId).observe(.childAdded, with: {
            snapshot in
            // print("snapshot key")
            // print(snapshot.key)
            
            Api.JCompProjComment.observeComments(withPostId: snapshot.key, completion: { comment in
                self.fetchUser(uid: comment.uid!, completed: {
                    self.jCompProjComments.append(comment)
                    // print(self.comments)
                    self.commentsInJCompProjFeedTableView.reloadData()
                })
            })
            
        })
        
    }
    
    /// it's job is to, given a user id, look up the corresponding user on db...
    func fetchUser(uid: String, completed: @escaping () -> Void) {
        
        Api.User.obersveUser(withId: uid, completion: { (user) in
            self.users.append(user)
            completed()
        })
        
        /// old code
        /*
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUser(dict: dict)
                self.users.append(user)
                completed()
            }
        })  */
        
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        let commentsRef = Api.JCompProjComment.REF_COMMENTS
        /// a unique id that is generated for every comment
        let newCommentId = commentsRef.childByAutoId().key
        let newCommentReference = commentsRef.child(newCommentId!)
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        /// uid of a user
        let currentUserId = currentUser.uid
        /// put that string in db
        newCommentReference.setValue(["uid": currentUserId, "commentText": commentTextField.text!], withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            /// new node to map 'posts' & 'comments'
            let postCommentRef = Api.JCompProjPostComment.REF_POST_COMMENTS.child(self.postId).child(newCommentId!)
            postCommentRef.setValue(true, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
            })
            /// empty and disable after a comment is posted
            self.empty()
            /// hide keyboard after comment is posted
            self.view.endEditing(true)
        })
        
    }
    
    // empty and disable after a comment is posted
    func empty() {
        
        self.commentTextField.text = ""
        self.sendOutlet.isEnabled = false
        sendImage.image = UIImage(named: "disableComment")
        
    }
    
}   // #186
