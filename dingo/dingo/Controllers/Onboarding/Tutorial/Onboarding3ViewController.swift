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
    var descriptionLabel = UILabel()
    var descriptionContainer: UIView!
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
        self.view.addSubview(descriptionContainer)
        drawEndButton()

    }
    
    func drawImage() {
        img = UIImageView(image: UIImage(named: "onboarding3"))
        img.frame = CGRect(x: w / 6, y: h / 6, width: w * 2 / 3, height: w * 2 / 3)
        img.isOpaque = false
        self.view.addSubview(img)
    }
    
    func drawDescription() {
        descriptionContainer = UIView(frame: CGRect(x: w / 8 - 10, y: h / 4, width: w / 2 + 40, height: h / 3))
        descriptionLabel = onboardingDescription3
        descriptionLabel.frame = descriptionContainer.frame
        descriptionLabel.center = descriptionContainer.center
        descriptionContainer.addSubview(descriptionLabel)
    }
    
    func drawEndButton() {
        nextButton = UIButton(frame: CGRect(x: 76, y: 516, width: 225, height: 50))
        nextButton.backgroundColor = secondaryColor
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.tag = 0
        nextButton.setTitle("Let's start!", for: [])
        nextButton.setTitleColor(mainColor, for: .normal)
        nextButton.addTarget(self, action: #selector(endSetup(_:)), for: .touchUpInside)
        
        view.addSubview(nextButton)
    }
    
    @objc func endSetup(_ button: UIButton) {
        performSegue(withIdentifier: "onboardingToHome", sender: nil)
        // NEED TO FIX THIS TODO
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HomepageViewController {
            destinationViewController.currentUser = currentUser
        }
    }
}
