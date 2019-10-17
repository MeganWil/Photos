//
//  PhotoViewController.swift
//  Photos
//
//  Created by Megan Wilson on 10/16/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var selectedImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cameraSelected(_ sender: UIBarButtonItem){
        photoTaken()
    }
    
    @IBAction func librarySelected(_ sender: Any) {
        selectFromLibrary()
    }
    
    func photoTaken(){
        if(!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            alert(title: "No Camera", message: "This device has no camera.")
        }
        else{
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
   
    func selectFromLibrary() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   selectedImage.image = pickedImage
               }
               dismiss(animated: true, completion: nil)
    }
    
    func alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
    }
    
    func imageDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
