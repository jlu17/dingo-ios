//
//  Onboarding2ViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/19/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class Onboarding2ViewController: UIViewController {
    
    var descriptionLabel2 = UILabel()
    var img: UIImageView!
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        w = self.view.bounds.width
        h = self.view.bounds.height
        super.viewDidLoad()
        view.backgroundColor = mainColor
        drawImage()
        drawDescription()
    }
    
    func drawImage() {
        img = UIImageView(image: UIImage(named: "onboarding2"))
        img.frame = CGRect(x: w / 6, y: h / 6, width: w * 2 / 3, height: w * 2 / 3)
        img.isOpaque = false
        self.view.addSubview(img)
    }
    
    func drawDescription() {
        descriptionLabel2 = onboardingDescription2
        descriptionLabel2.frame = CGRect(x: w/8, y: h/2, width: w*3/4, height: h/4)
        self.view.addSubview(descriptionLabel2)
    }
}
