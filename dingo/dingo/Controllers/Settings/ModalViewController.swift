//
//  ModalViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/20/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    var cancelButton: UIButton!
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor.withAlphaComponent(0.8)
        w = self.view.bounds.width
        h = self.view.bounds.height
        view.isOpaque = false
        print("HELLOOOOO")
        // Do any additional setup after loading the view.
        drawCancel()
        drawOptions()
        
    }
    
    func drawCancel() {
        let settingsIcon = UIImageView(image: UIImage(named: "cancelIcon"))
        let buttonSize = 25
        settingsIcon.frame = CGRect(x: Int(w) - buttonSize - 50, y: 60, width: buttonSize, height: buttonSize)
        settingsIcon.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancel(_:)))
        settingsIcon.isUserInteractionEnabled = true
        settingsIcon.addGestureRecognizer(tap)
        self.view.addSubview(settingsIcon)
    }
    
    func drawOptions() {
        
        let iconSize = CGFloat(25)
        let optionWidth = 130 + iconSize
        let aboutFrame = CGRect(x: w - optionWidth, y: h/6, width: optionWidth, height: 50)
        let logoutFrame = CGRect(x: w - optionWidth, y: h/4, width: optionWidth, height: 50)
        drawTab(frame: aboutFrame, action: #selector(about(_:)), text: "About")
        drawTab(frame: logoutFrame, action: #selector(logout(_:)), text: "Log out")
       
        let aboutIconFrame = CGRect(x: aboutFrame.origin.x + 10, y: aboutFrame.origin.y + (aboutFrame.height - iconSize) / 2, width: iconSize, height: iconSize)
        let logoutIconFrame = CGRect(x: logoutFrame.origin.x + 10, y: logoutFrame.origin.y + (logoutFrame.height - iconSize) / 2, width: iconSize, height: iconSize)
        
        drawIcon(name: "aboutIcon-navy", frame: aboutIconFrame, action: #selector(cancel(_:)))
        drawIcon(name: "logoutIcon-navy", frame: logoutIconFrame, action: #selector(logout(_:)))
    }
    
    func drawTab(frame: CGRect, action: Selector, text: String) {
        let button = UIButton(frame: frame)
        button.backgroundColor = white
        
        button.titleLabel?.font = subTitleFont
        button.addTarget(self, action: action, for: .touchUpInside)
        button.contentHorizontalAlignment = .right
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.setTitle(text, for: [])
        button.setTitleColor(mainColor, for: .normal)
        button.titleEdgeInsets.right = 20; // add left padding.

        
        self.view.addSubview(button)
    }
    
    func drawIcon(name: String, frame: CGRect, action: Selector) {
        let icon = UIImageView(image: UIImage(named: name))
        icon.isOpaque = false
        icon.frame = frame
        
        let tap = UITapGestureRecognizer(target: self, action: action)
        icon.isUserInteractionEnabled = true
        icon.addGestureRecognizer(tap)
        self.view.addSubview(icon)
    }
    
    @objc func cancel(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func about(_ sender: Any?) {
        let aboutVC = AboutViewController()
        aboutVC.modalPresentationStyle = .overCurrentContext
        self.present(aboutVC, animated: true)
    }
    
    @objc func logout(_ sender: Any?) {
        let logoutVC = LogOutViewController()
        logoutVC.modalPresentationStyle = .overCurrentContext
        self.present(logoutVC, animated: true)
    }
}
