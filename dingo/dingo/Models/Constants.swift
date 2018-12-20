//
//  Constants.swift
//  dingo
//
//  Created by Jennifer Lu on 7/7/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import ChameleonFramework

let mainFont = "Avenir-Medium"
let firebasePack = "pack"
// let mainColor = FlatBlue()
let mainColor = UIColor(red: 15/255, green: 65/255, blue: 114/255, alpha: 1)
let secondaryColor = UIColor(red: 127/255, green: 195/255, blue: 216/255, alpha: 1)

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

