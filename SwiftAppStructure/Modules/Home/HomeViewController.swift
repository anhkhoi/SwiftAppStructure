//
//  HomeViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/25/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {

    @IBOutlet weak var slideshow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideshow.setImageInputs([
            ImageSource(image: UIImage(named: "banner1")!),
            ImageSource(image: UIImage(named: "banner2")!),
            ImageSource(image: UIImage(named: "banner3")!),
            ImageSource(image: UIImage(named: "banner4")!),
            ImageSource(image: UIImage(named: "banner5")!)
        ])
        
        slideshow.contentScaleMode = .scaleAspectFill
    }

}
