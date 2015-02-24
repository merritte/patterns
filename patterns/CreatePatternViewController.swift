//
//  CreatePatternViewController.swift
//  patterns
//
//  Created by Merritte on 2/23/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit
import CoreData

class CreatePatternViewController: UIViewController {

    @IBOutlet weak var patternTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    @IBAction func savedTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as Pattern
        pattern.name = self.patternTextField.text
        context.save(nil)
        self.dismissViewControllerAnimated(true, completion: nil)

    }

}
