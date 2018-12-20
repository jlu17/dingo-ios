//
//  HomepageViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomepageViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) { }
    var currentUser: User!
    var whoLabel = UILabel()
    var whereLabel = UILabel()
    var settingsButton: UIButton!
    var dingoCircleView: UIImageView!
    let buttonSize = 25
    
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        w = self.view.bounds.width
        h = self.view.bounds.height
        
        view.backgroundColor = mainColor
        drawStartButton()
        drawMainText()
        drawDefaults()
        drawSettingsButton()
        drawNotificationsButton()
    }
    
    func drawStartButton() {
        dingoCircleView = UIImageView(image: UIImage(named: "dingoCircle"))
        dingoCircleView.frame.size = CGSize(width: dingoCircleView.image!.size.width / 4, height: dingoCircleView.image!.size.width / 4)
        dingoCircleView.center = self.view.center
        dingoCircleView.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(startJourney(_:)))
        dingoCircleView.isUserInteractionEnabled = true
        dingoCircleView.addGestureRecognizer(tap)
        self.view.addSubview(dingoCircleView)
    }
    
    func drawMainText() {
        let main = UILabel()
        main.frame = CGRect(x: w / 4, y: 0, width: w / 2, height: h / 2)
        main.text = "Press and hold to start your journey."
        main.font = subTitleFont
        main.lineBreakMode = NSLineBreakMode.byWordWrapping
        main.numberOfLines = 2
        main.textColor = FlatWhite()
        main.textAlignment = .center
        self.view.addSubview(main)
    }
    
    func drawDefaults() {
        
        // Text
        let locationText = drawDefaultDescriptions(text: "I'm going to")
        let friendText = drawDefaultDescriptions(text: "and notifying")
        
        // Button
        let locationButton = drawDefaultButtons(title: "2437 Dwight Way")
        locationButton.addTarget(self, action: #selector(defaultLocation(_:)), for: .touchUpInside)
        let friendsButton = drawDefaultButtons(title: "Nidhi, Kelvin")
        friendsButton.addTarget(self, action: #selector(defaultFriends(_:)), for: .touchUpInside)
        
        let dingoBottom = dingoCircleView.frame.origin.y + dingoCircleView.frame.height + h/16
        
        let defaultButtonHeight = h/16
        let defaultButtonWidth = w/2
        let defaultMarginWidth = (w - defaultButtonWidth) / 2
        
        locationText.frame = CGRect(x: defaultMarginWidth, y: dingoBottom, width: defaultButtonWidth, height: defaultButtonHeight / 2)
        locationButton.frame = CGRect(x: defaultMarginWidth, y: dingoBottom + defaultButtonHeight/2, width: defaultButtonWidth, height: defaultButtonHeight)
        friendText.frame = CGRect(x: defaultMarginWidth, y: dingoBottom + defaultButtonHeight*3/2, width: defaultButtonWidth, height: defaultButtonHeight / 2)
        friendsButton.frame = CGRect(x: defaultMarginWidth, y: dingoBottom + defaultButtonHeight*2, width: defaultButtonWidth, height: defaultButtonHeight)
        
        
        self.view.addSubview(locationText)
        self.view.addSubview(friendText)
        self.view.addSubview(locationButton)
        self.view.addSubview(friendsButton)
    }
    
    func drawDefaultDescriptions(text: String) -> UILabel {
        let description = UILabel()
        description.text = text
        description.textColor = UIColor(white: 1, alpha: 0.5)
        description.font = smallFont
        description.textAlignment = .center
        return description
    }
    
    func drawDefaultButtons(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(white: 1, alpha: 0.1)
        button.tag = 1
        button.setTitle(title, for: [])
        button.setTitleColor(UIColor.white, for: [])
        button.titleLabel?.font =  subTitleFont
        button.layer.cornerRadius = 10
        
        //shadow
        
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        return button
    }
    
    func drawNotificationsButton() {
        let notificationsIcon = UIImageView(image: UIImage(named: "notificationsIcon"))
        notificationsIcon.frame = CGRect(x: 50, y: 60, width: buttonSize, height: buttonSize)
        notificationsIcon.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(notifications(_:)))
        notificationsIcon.isUserInteractionEnabled = true
        notificationsIcon.addGestureRecognizer(tap)
        self.view.addSubview(notificationsIcon)
    }
    
    func drawSettingsButton() {
        let settingsIcon = UIImageView(image: UIImage(named: "otherIcon"))
        settingsIcon.frame = CGRect(x: Int(w) - buttonSize - 50, y: 60, width: buttonSize, height: buttonSize)
        settingsIcon.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(settings(_:)))
        settingsIcon.isUserInteractionEnabled = true
        settingsIcon.addGestureRecognizer(tap)
        self.view.addSubview(settingsIcon)
    }

    @objc func startJourney(_ Sender: Any?) {
        print("Circle clicked!")
        performSegue(withIdentifier: "homepageToProgress", sender: nil)
    }
    
    @objc func notifications(_ Sender: Any?) {
        print("Notifications clicked!")
    }
    
    @objc func settings(_ Sender: Any?) {
        print("Settings clicked!")
        // performSegue(withIdentifier: "toSettings", sender: nil)
        
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        
        self.overlayBlurredBackgroundView()
        self.present(ModalViewController(), animated: true)
    }
    
    @objc func defaultLocation(_ Sender: Any?) {
        print("Default Location clicked!")
    }
    
    @objc func defaultFriends(_ Sender: Any?) {
        print("Default Friends clicked!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func overlayBlurredBackgroundView() {
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        
        view.addSubview(blurredBackgroundView)
    }
    
    func removeBlurredBackgroundView() {
        
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "ShowModalSettings" {
                if let viewController = segue.destination as? ModalViewController {
                    viewController.delegate = self
                    viewController.modalPresentationStyle = .overFullScreen
                }
            }
        }
    }
    
    //not relevant anymore
    //        let startButton = UIButton(type: UIButtonType.custom) as UIButton
    //        startButton.frame.size = CGSize(width: self.view.bounds.midX, height: self.view.bounds.midX)
    //        startButton.center = self.view.center
    //        startButton.backgroundColor = FlatWhite()
    //        startButton.tag = 0
    //        startButton.setImage(dingoCircleView.image, for: [])
    //        startButton.setTitleColor(FlatBlack(), for: [])
    //        startButton.addTarget(self, action: #selector(startJourney(_:)), for: .touchUpInside)
    //self.view.addSubview(startButton)
}
