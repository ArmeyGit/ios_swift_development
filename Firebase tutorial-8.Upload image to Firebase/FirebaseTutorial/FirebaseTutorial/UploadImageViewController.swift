//
//  UploadImageViewController.swift
//  FirebaseTutorial
//
//  Created by Nguyen Duc Hoang on 4/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class UploadImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var txtPetName:UITextField!
    @IBOutlet weak var txtPetAge:UITextField!
    @IBOutlet weak var imageViewPet:UIImageView!
    @IBOutlet weak var btnSelectImage:UIButton!
    @IBOutlet weak var btnUpload:UIButton!
    var picker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPetName.translatesAutoresizingMaskIntoConstraints = false
        txtPetAge.translatesAutoresizingMaskIntoConstraints = false
        imageViewPet.translatesAutoresizingMaskIntoConstraints = false
        btnSelectImage.translatesAutoresizingMaskIntoConstraints = false
        btnUpload.translatesAutoresizingMaskIntoConstraints = false
        
        txtPetName.placeholder = "Enter your pet's name"
        txtPetAge.placeholder = "Pet's age"
        txtPetName.text = "Meo meo xx123"
        txtPetAge.text = "5"
        // Do any additional setup after loading the view.
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .top, relatedBy: .equal,
                                              toItem: view, attribute: .top, multiplier: 1, constant: 40))
        view.addConstraint(NSLayoutConstraint(item: txtPetName, attribute: .left, relatedBy: .equal,
                                              toItem: view, attribute: .left, multiplier: 1, constant: 30))
        
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .height, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .height, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .left, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: txtPetAge, attribute: .top, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .bottom, multiplier: 1, constant: 20))
        
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .top, relatedBy: .equal,
                                              toItem: txtPetAge, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .left, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .width, relatedBy: .equal,
                                              toItem: txtPetName, attribute: .width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageViewPet, attribute: .width, relatedBy: .equal,
                                              toItem: imageViewPet, attribute: .height, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: btnSelectImage, attribute: .top, relatedBy: .equal,
                                              toItem: imageViewPet, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: btnSelectImage, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120))
        view.addConstraint(NSLayoutConstraint(item: btnSelectImage, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        view.addConstraint(NSLayoutConstraint(item: btnUpload, attribute: .top, relatedBy: .equal,
                                              toItem: btnSelectImage, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: btnUpload, attribute: .width, relatedBy: .equal,
                                              toItem: btnSelectImage, attribute: .width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnUpload, attribute: .height, relatedBy: .equal,
                                              toItem: btnSelectImage, attribute: .height, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: btnSelectImage, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnUpload, attribute: .centerX, relatedBy: .equal,
                                              toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        btnSelectImage.backgroundColor = UIColor.green
        btnUpload.backgroundColor = UIColor.green
        imageViewPet.layer.borderWidth = 1
        imageViewPet.layer.borderColor = UIColor.darkGray.cgColor
        btnSelectImage.addTarget(self, action: #selector(btnSelectImage(sender:)), for: .touchUpInside)
        btnUpload.addTarget(self, action: #selector(btnUpload(sender:)), for: .touchUpInside)
    }

    @IBAction func btnSelectImage(sender: AnyObject) {
        print("btnSelectImage")
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.openCamera()
        }
        let GalleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
        }
        
        self.picker = UIImagePickerController()
        // Add the actions
        self.picker?.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(GalleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            picker!.sourceType = UIImagePickerControllerSourceType.camera
            self.present(picker!, animated: true, completion: nil)
        }
        else {
            let alert:UIAlertController=UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: UIAlertControllerStyle.actionSheet)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker!, animated: true, completion: nil)
    }
    //UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageViewPet.contentMode = .scaleToFill
            self.imageViewPet.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnUpload(sender: AnyObject) {
        print("btnUpload")
        if(imageViewPet == nil) {
            print("image is nil. Cannot upload")
            return
        }
        
        let storageRef = (UIApplication.shared.delegate as! AppDelegate).firebaseStorage?.reference().child("images")
        let fileName = String.randomString(length: 20) + ".jpg"
        let imageRef = storageRef?.child(fileName)
        let imageData:Data = UIImagePNGRepresentation(imageViewPet.image!)!
        let uploadTask = imageRef?.put(imageData, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("cannot upload image to Firebase !")
//                print("Error = \(error?.localizedDescription)")
                return
            }
            //success
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL
            print("downloadURL : \(downloadURL()?.path ?? "")")
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("pets").child("meo meoXX")
                .setValue(["name": self.txtPetName?.text ?? "",
                           "age": self.txtPetAge?.text ?? "",
                           "imageFullPath": downloadURL()?.path ?? "",
                           "imageName": fileName
                    ])
            
        }
        // Add a progress observer to an upload task
        let observer = uploadTask?.observe(.progress) { snapshot in
            print("upload progress = \(snapshot.progress?.localizedDescription)")
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
