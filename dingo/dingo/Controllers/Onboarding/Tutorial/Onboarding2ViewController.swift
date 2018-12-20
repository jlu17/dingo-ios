//
//  Onboarding2ViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/19/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class Onboarding2ViewController: UIViewController {
    
    var descriptionLabel = UILabel()
    var descriptionContainer: UIView!
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
        self.view.addSubview(descriptionContainer)


    }
    
    func drawImage() {
        img = UIImageView(image: UIImage(named: "onboarding2"))
        img.frame = CGRect(x: w / 6, y: h / 6, width: w * 2 / 3, height: w * 2 / 3)
        img.isOpaque = false
        self.view.addSubview(img)
    }
    
    func drawDescription() {
        descriptionContainer = UIView(frame: CGRect(x: w / 8 - 10, y: h / 4, width: w / 2 + 40, height: h / 3))
        descriptionLabel = onboardingDescription2
        descriptionLabel.frame = descriptionContainer.frame
        descriptionLabel.center = descriptionContainer.center
        descriptionContainer.addSubview(descriptionLabel)
    }
}
