//
//  ZoomViewController.swift
//  patterns
//
//  Created by Merritte on 2/22/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Go Go GO
        
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 50
        self.scrollView.delegate = self
        self.imageView.image = self.image!
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
