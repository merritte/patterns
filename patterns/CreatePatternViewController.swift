//
//  CreatePatternViewController.swift
//  patterns
//
//  Created by Merritte on 2/23/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit
import CoreData

class CreatePatternViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var frontPicture = true
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var patternTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)
        
        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
    }
    
    func frontTapped() {
        self.frontPicture = true
        launchCamera()
            }
    
    func backTapped() {
        self.frontPicture = false
        launchCamera()
            }

    func launchCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        if self.frontPicture{
            self.frontImageView.image = image
        } else {
            self.backImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    @IBAction func savedTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as Pattern
        pattern.name = self.patternTextField.text
        pattern.frontImage = UIImageJPEGRepresentation(self.frontImageView.image, 1)
        pattern.backImage = UIImageJPEGRepresentation(self.backImageView.image, 1)
        context.save(nil)
        self.dismissViewControllerAnimated(true, completion: nil)

    }

}
