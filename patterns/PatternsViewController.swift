//
//  ViewController.swift
//  patterns
//
//  Created by Merritte on 2/19/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit
import CoreData

class PatternsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var patterns : [Pattern] = []
    var selectedPattern : Pattern? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        createTestPatterns()
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Pattern")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if results != nil {
            self.patterns = results! as [Pattern]
        }

    }
    
    func createTestPatterns(){
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as Pattern
        
    pattern.name = "hood hoodie"
    pattern.frontImage = UIImageJPEGRepresentation(UIImage(named:"dessimg.jpg"), 1)
    pattern.backImage = UIImageJPEGRepresentation(UIImage(named:"jumperpattern.jpg"), 1)

        context.save(nil)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.patterns.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var pattern = self.patterns[indexPath.row]
        cell.textLabel!.text = pattern.name
        cell.imageView!.image = UIImage(data: pattern.frontImage)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedPattern = self.patterns[indexPath.row]
        self.performSegueWithIdentifier("patternDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailViewController = segue.destinationViewController as PatternDetailViewController
        detailViewController.pattern = self.selectedPattern
    }

}

