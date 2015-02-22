//
//  PatternDetailViewController.swift
//  patterns
//
//  Created by Merritte on 2/21/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit

class PatternDetailViewController: UIViewController {
    
    var pattern : Pattern? = nil
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = self.pattern!.name
        self.frontImageView.image = UIImage(data: self.pattern!.frontImage)
        self.backImageView.image = UIImage(data: self.pattern!.backImage)

    }

   }
