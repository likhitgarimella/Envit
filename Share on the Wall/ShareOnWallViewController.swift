//
//  ShareOnWallViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 10/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
import JGProgressHUD

class ShareOnWallViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var photoView: UIView!
    @IBOutlet var insideView: UIView!
    
    /// main image
    @IBOutlet var selectPhotoImage: UIImageView!
    
    /// main textfield
    @IBOutlet var saySomething: UITextField!
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    
    /// dummy label for frame color
    @IBOutlet var frameColorLabel: UILabel!
    
    /// reference label
    @IBOutlet var selectCategory: UILabel!
    
    /// dummy label for category name
    @IBOutlet var categoryLabel: UILabel!
    
    /// main button outlet
    @IBOutlet var shareOutlet: UIButton!
    
    // MARK: - Scroll view
    
    /// scroll view
    var scView: UIScrollView!
    /// space b/w button and cell
    let buttonPadding: CGFloat = 10
    var xOffset: CGFloat = 10
    
    // MARK: - Declarations
    
    var selectedImage: UIImage?
    
    /// global declaration
    let button = UIButton.init(type: .custom)
    
    /// selected index of button in scroll view
    var selectedIndex : Int = 0
    
    /// array of buttons
    var buttonArray : NSMutableArray = []
    
    /// array data
    let names = ["abcdefghijkl", "abcdef", "abcd", "abcdefgh", "abcdefghijkl", "abcdef", "abcd", "abcdefgh", "abcdefghijkl", "abcdef", "abcd", "abcdefgh"]
    
    // progress hud
    let hud1 = JGProgressHUD(style: .dark)
    
    func Properties() {
        
        photoView.layer.cornerRadius = 10
        insideView.layer.cornerRadius = 5
        selectPhotoImage.image = UIImage(named: "selectPhoto")
        selectPhotoImage.layer.cornerRadius = 5
        
        // MARK: - Initial state
        
        /// purple color
        photoView.backgroundColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        frameColorLabel.text = "purple"
        
        buttonOne.setImage(UIImage(named: "purpleOn"), for: .normal)
        /// purple color
        buttonOne.tintColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonThree.tintColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonFour.tintColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
        shareOutlet.layer.cornerRadius = 10
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Horz scroll view, properties & conditions
        
        /// scroll view
        let scView = UIScrollView()
        scView.delegate = self
        // scView.contentSize = CGSize(width: view.bounds.width, height: 50)
        // scView = UIScrollView(frame: CGRect(x: 0, y: 620, width: view.bounds.width, height: 50))
        
        scView.showsHorizontalScrollIndicator = false
        
        /// adding scroll view to view
        view.addSubview(scView)
        
        /// scroll view constraints
        scView.translatesAutoresizingMaskIntoConstraints = false
        scView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scView.topAnchor.constraint(equalTo: selectCategory.bottomAnchor, constant: 10).isActive = true
        scView.bottomAnchor.constraint(equalTo: shareOutlet.topAnchor, constant: -30).isActive = true
        
        /// bg color
        scView.backgroundColor = UIColor.orange
        
        /// array count
        for j in 0 ..< names.count {
            
            /// array index
            let name = names[j]
            /// button
            let button = UIButton()
            /// button tag
            button.tag = j
            button.layer.cornerRadius = 15
            button.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
            button.titleLabel?.font = UIFont(name: "SFProRounded-Medium", size: 16)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            button.setTitle(name, for: .normal)
            /// add target
            button.addTarget(self, action: #selector(self.buttonEvent(_:)), for: .touchUpInside)
            /// old one
            // button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
            
            let strofMenu = names[selectedIndex]
            
            if (j == selectedIndex) {
                if(strofMenu == "abcdefghijkl") {
                    /// button selected
                    button.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                }
                /// button normal
                button.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                button.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            } else {
                /// button normal
                button.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                button.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            }
            
            /// add buttons to button array
            buttonArray.add(button)
            
            /// button positions & dimensions
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: button.intrinsicContentSize.width + 48, height: 30)
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            /// adding button to scroll view
            scView.addSubview(button)
            
        }
        
        /// scroll view prop
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        hideKeyboardWhenTappedAround()
        
        Properties()
        
        // Add gesture for image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto))
        selectPhotoImage.addGestureRecognizer(tapGesture)
        selectPhotoImage.isUserInteractionEnabled = true
        
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        
        /// button taptic
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        /// button tag
        let index = sender.tag
        /// selected index = button tag
        selectedIndex = index
        /// name of selected button
        let selectedButtonName = names[index]
        /// print name of selected button & button tag
        print("\(selectedButtonName); \(sender.tag)")
        /// print that in dummy label
        categoryLabel.text = selectedButtonName
        
        for i in 0 ..< buttonArray.count {
            let buttonone : UIButton = (buttonArray[i] as! UIButton)
            if i == selectedIndex {
                /// button selected
                buttonone.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
                buttonone.setTitleColor(UIColor.white, for: .normal)
            } else {
                /// button normal
                buttonone.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                buttonone.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            }
        }
        
    }
    
    /// old one
    /*
    @objc func buttonTouch(sender: UIButton) {
        let taptic = UIImpactFeedbackGenerator(style: .medium)
        taptic.prepare()
        taptic.impactOccurred()
        print(sender.tag)
        // print(buttonArray)
    }
    */
    
    @IBAction func buttonOneAction(_ sender: UIButton) {
        
        let taptic1 = UIImpactFeedbackGenerator(style: .medium)
        taptic1.prepare()
        taptic1.impactOccurred()
        
        /// purple color
        photoView.backgroundColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        frameColorLabel.text = "purple"
        
        buttonOne.setImage(UIImage(named: "purpleOn"), for: .normal)
        /// purple color
        buttonOne.tintColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonThree.tintColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonFour.tintColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        
        let taptic2 = UIImpactFeedbackGenerator(style: .medium)
        taptic2.prepare()
        taptic2.impactOccurred()
        
        /// blue color
        photoView.backgroundColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        frameColorLabel.text = "blue"
        
        buttonOne.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonOne.tintColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOn"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonThree.tintColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonFour.tintColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonThreeAction(_ sender: UIButton) {
        
        let taptic3 = UIImpactFeedbackGenerator(style: .medium)
        taptic3.prepare()
        taptic3.impactOccurred()
        
        /// green color
        photoView.backgroundColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        frameColorLabel.text = "green"
        
        buttonOne.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonOne.tintColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "greenOn"), for: .normal)
        /// green color
        buttonThree.tintColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonFour.tintColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonFourAction(_ sender: UIButton) {
        
        let taptic4 = UIImpactFeedbackGenerator(style: .medium)
        taptic4.prepare()
        taptic4.impactOccurred()
        
        /// red color
        photoView.backgroundColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
        frameColorLabel.text = "red"
        
        buttonOne.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonOne.tintColor = UIColor(red: 146/255, green: 110/255, blue: 209/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 129/255, green: 188/255, blue: 245/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonThree.tintColor = UIColor(red: 126/255, green: 199/255, blue: 162/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "redOn"), for: .normal)
        /// red color
        buttonFour.tintColor = UIColor(red: 240/255, green: 125/255, blue: 125/255, alpha: 1.0)
        
    }
    
    @objc func handleSelectPhoto() {
        
        let pickerController = UIImagePickerController()
        // To get access to selected media files, add delegate
        pickerController.delegate = self
        /// presenting it in full screen bcuz...
        /// i want the view to change...
        /// so that viewWillAppear will work...
        pickerController.modalPresentationStyle = .fullScreen
        // present photo library
        present(pickerController, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handlePost()
        
    }
    
    func handlePost() {
        
        if selectedImage != nil {
            // Enable
            self.shareOutlet.isEnabled = true
            shareOutlet.setTitleColor(UIColor.white, for: .normal)
            // shareOutlet.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        } else {
            // Disable
            self.shareOutlet.isEnabled = false
            shareOutlet.setTitleColor(UIColor.lightText, for: .normal)
            // shareOutlet.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        }
        
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        
        hud1.show(in: self.view)
        
        // selected image(imageSelected) should be from selectedImage
        guard let imageSelected = self.selectedImage else {
            print("Avatar is nil")
            hud1.indicatorView = nil    // remove indicator
            hud1.textLabel.text = "Empty image"
            hud1.dismiss(afterDelay: 2.0, animated: true)
            return
        }
        // image data from selected image in jpeg format
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        HelperService.uploadDataToServer(data: imageData, caption: saySomething.text!, frame: frameColorLabel.text!, category: categoryLabel.text!, onSuccess: {
            self.clean()
            // self.tabBarController?.selectedIndex = 0
        })
        
    }
    
    // Reset function
    func clean() {
        self.selectPhotoImage.image = UIImage(named: "selectPhoto")
        // selected image should be blank again, after we push the post to db
        self.selectedImage = nil
        self.saySomething.text = "Say something about this..."
        // setting back text view text color to light gray, so that delegate methods work
        // self.captionTextView.textColor = UIColor.lightGray
    }
    
}

extension ShareOnWallViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Selected image to display it in our image view
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Store this img in an instance variable
            selectedImage = image
            // set image's imageView to selected image
            selectPhotoImage.image = image
        }
        print("Image selected from library")
        dismiss(animated: true, completion: nil)
    }
    
}   // #440
