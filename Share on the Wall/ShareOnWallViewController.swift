//
//  ShareOnWallViewController.swift
//  VIT Share
//
//  Created by Likhit Garimella on 10/07/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class ShareOnWallViewController: UIViewController {
    
    // Outlets
    @IBOutlet var photoView: UIView!
    @IBOutlet var insideView: UIView!
    
    @IBOutlet var selectPhotoImage: UIImageView!
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    
    var selectedImage: UIImage?
    
    let button = UIButton.init(type: .custom)
    
    var selectedIndex : Int = 0
    
    var buttonArray : NSMutableArray = []
    
    // scroll view
    var scView: UIScrollView!
    // space b/w button and cell
    let buttonPadding: CGFloat = 10
    var xOffset: CGFloat = 10
    
    let names = ["abcdefghijkl", "abcdef", "abcd", "abcdefgh", "abcdefghijkl", "abcdef", "abcd", "abcdefgh", "abcdefghijkl", "abcdef", "abcd", "abcdefgh"]
    
    func Properties() {
        
        photoView.layer.cornerRadius = 10
        insideView.layer.cornerRadius = 5
        selectPhotoImage.image = UIImage(named: "selectPhoto")
        selectPhotoImage.layer.cornerRadius = 5
        
        // MARK: - Initial state
        
        /// red color
        photoView.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonOne.setImage(UIImage(named: "redOn"), for: .normal)
        /// red color
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonThree.tintColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonFour.tintColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Horz coll view
        
        /// scroll view positions & dimensions
        scView = UIScrollView(frame: CGRect(x: 0, y: 640, width: view.bounds.width, height: 50))
        /// adding scroll view to view
        view.addSubview(scView)
        
        /// bg color
        scView.backgroundColor = UIColor.orange
        /// constraint
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
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
            // button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
            
            let strofMenu = names[selectedIndex]
            
            if (j == selectedIndex) {
                if(strofMenu == "abcdefghijkl") {
                    button.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
                    button.setTitleColor(UIColor.white, for: .normal)
                }
                button.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                button.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            } else {
                button.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                button.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            }
            
            buttonArray.add(button)
            
            /// button positions & dimensions
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: button.intrinsicContentSize.width + 48, height: 30)
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            /// adding button to scroll view
            scView.addSubview(button)
            
        }

        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        hideKeyboardWhenTappedAround()
        
        Properties()
        
        // Add gesture for image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto))
        selectPhotoImage.addGestureRecognizer(tapGesture)
        selectPhotoImage.isUserInteractionEnabled = true
        
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        let index = sender.tag
        selectedIndex = index
        let getRepoName = names[index]
        print("\(getRepoName); \(sender.tag)")
        for i in 0 ..< buttonArray.count {
            let buttonone : UIButton = (buttonArray[i] as! UIButton)
            if i == selectedIndex {
                buttonone.backgroundColor = UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0)
                buttonone.setTitleColor(UIColor.white, for: .normal)
            } else {
                buttonone.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1.0)
                buttonone.setTitleColor(UIColor(red: 254/255, green: 110/255, blue: 110/255, alpha: 1.0), for: .normal)
            }
        }
        
    }
    
    /*
    @objc func buttonTouch(sender: UIButton) {
        let taptic = UIImpactFeedbackGenerator(style: .medium)
        taptic.prepare()
        taptic.impactOccurred()
        print(sender.tag)
        // print(buttonArray)
    }
    */
    
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
        
        
        
    }
    
    @IBAction func buttonOneAction(_ sender: UIButton) {
        
        let taptic1 = UIImpactFeedbackGenerator(style: .medium)
        taptic1.prepare()
        taptic1.impactOccurred()
        
        /// red color
        photoView.backgroundColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonOne.setImage(UIImage(named: "redOn"), for: .normal)
        /// red color
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonThree.tintColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonFour.tintColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        
        let taptic2 = UIImpactFeedbackGenerator(style: .medium)
        taptic2.prepare()
        taptic2.impactOccurred()
        
        /// blue color
        photoView.backgroundColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonOne.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOn"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonThree.tintColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonFour.tintColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonThreeAction(_ sender: UIButton) {
        
        let taptic3 = UIImpactFeedbackGenerator(style: .medium)
        taptic3.prepare()
        taptic3.impactOccurred()
        
        /// purple color
        photoView.backgroundColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonOne.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "purpleOn"), for: .normal)
        /// purple color
        buttonThree.tintColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "greenOff"), for: .normal)
        /// green color
        buttonFour.tintColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
    }
    
    @IBAction func buttonFourAction(_ sender: UIButton) {
        
        let taptic4 = UIImpactFeedbackGenerator(style: .medium)
        taptic4.prepare()
        taptic4.impactOccurred()
        
        /// green color
        photoView.backgroundColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
        buttonOne.setImage(UIImage(named: "redOff"), for: .normal)
        /// red color
        buttonOne.tintColor = UIColor(red: 253/255, green: 181/255, blue: 181/255, alpha: 1.0)
        
        buttonTwo.setImage(UIImage(named: "blueOff"), for: .normal)
        /// blue color
        buttonTwo.tintColor = UIColor(red: 158/255, green: 205/255, blue: 251/255, alpha: 1.0)
        
        buttonThree.setImage(UIImage(named: "purpleOff"), for: .normal)
        /// purple color
        buttonThree.tintColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1.0)
        
        buttonFour.setImage(UIImage(named: "greenOn"), for: .normal)
        /// green color
        buttonFour.tintColor = UIColor(red: 182/255, green: 231/255, blue: 206/255, alpha: 1.0)
        
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
    
}   // #322
