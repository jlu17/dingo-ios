//
//  OnboardingButton.swift
//  dingo
//
//  Created by Jennifer Lu on 12/20/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class OnboardingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addDetail()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addDetail()
    }
    
    func addDetail() {
        self.backgroundColor = secondaryColor
        self.tag = 0
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = subTitleFont
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}

// Onboarding
func handleText(t: String) -> UILabel {
    let label = UILabel()
    label.text = t
    label.textColor = UIColor.white
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 4
    label.font = UIFont(name: mainFont, size: 20)
    return label
}

let onboardingDescription1 = handleText(t: "Tap the button to start your journey home. (Or, change location/friend to notify.) ")
let onboardingDescription2 = handleText(t: "Start walking home! We’ll passively check-in on your location along the way.")
let onboardingDescription3 = handleText(t: "Get home! Your friend is automatically notified, and we stop following your location.")
