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
    
    func Properties() {
        
        photoView.layer.cornerRadius = 10
        insideView.layer.cornerRadius = 5
        selectPhotoImage.image = UIImage(named: "selectPhoto")
        selectPhotoImage.layer.cornerRadius = 5
        
        // MARK: - Inital state
        
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
        
        hideKeyboardWhenTappedAround()
        
        Properties()
        
        // Add gesture for image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto))
        selectPhotoImage.addGestureRecognizer(tapGesture)
        selectPhotoImage.isUserInteractionEnabled = true
        
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
    
}   // #216
