//
//  Onboarding3ViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/19/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class Onboarding3ViewController: UIViewController {
    var currentUser: User!
    var descriptionLabel3 = UILabel()
    var img: UIImageView!
    var w: CGFloat!
    var h: CGFloat!
    var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        w = self.view.bounds.width
        h = self.view.bounds.height
        super.viewDidLoad()
        view.backgroundColor = mainColor
        drawImage()
        drawDescription()
        drawEndButton()

    }
    
    func drawImage() {
        img = UIImageView(image: UIImage(named: "onboarding3"))
        img.frame = CGRect(x: w / 6, y: h / 6, width: w * 2 / 3, height: w * 2 / 3)
        img.isOpaque = false
        self.view.addSubview(img)
    }
    
    func drawDescription() {
        descriptionLabel3 = onboardingDescription3
        descriptionLabel3.frame = CGRect(x: w/8, y: h/2, width: w*3/4, height: h/4)
        self.view.addSubview(descriptionLabel3)
    }
    
    func drawEndButton() {
        nextButton = OnboardingButton(frame: CGRect(x: w/8, y: h - w/2, width: w*3/4, height: w / 8))
        nextButton.setTitle("Let's start!", for: [])
        nextButton.addTarget(self, action: #selector(endSetup(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    @objc func endSetup(_ button: UIButton) {
        performSegue(withIdentifier: "onboardingToHome", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HomepageViewController {
            destinationViewController.currentUser = currentUser
        }
    }
}
