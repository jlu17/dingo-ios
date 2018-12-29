//
//  AboutViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 5/3/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework

class AboutViewController: UIViewController {
    
    var container: UIView!
    var des = UILabel()
    var home: UIImageView!
    
    var w: CGFloat!
    var h: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        w = self.view.bounds.width
        h = self.view.bounds.height
        
        drawBackBox()
        drawDescription()
    }
    
    @objc func toHome(_ button: UIButton) {
        self.performSegue(withIdentifier: "aboutToHome", sender: nil)
    }
    
    func drawBackBox() {
        let box = UIView(frame: CGRect(x: 20, y: 80, width: w - 40, height: 600))
        box.backgroundColor = white
        box.layer.shadowColor = UIColor.black.cgColor
        box.layer.shadowOpacity = 0.3
        box.layer.shadowOffset = CGSize(width: 0, height: 3)
        box.layer.shadowRadius = 4
        self.view.addSubview(box)
        
        // Team
        let teamText = UILabel()
        let margin = 20
        teamText.text = "Team"
        teamText.frame = CGRect(x: Int(box.frame.origin.x), y: Int(box.frame.origin.y) + margin, width: Int(box.frame.width), height: 30)
        teamText.textAlignment = .center
        teamText.font = titleFont
        teamText.textColor = mainColor
        self.view.addSubview(teamText)
        
        // Cancel icon
        let cancelIcon = UIImageView(image: UIImage(named: "cancelIcon-navy"))
        let buttonSize = 25
        cancelIcon.frame = CGRect(x: Int(box.frame.width) - buttonSize - margin, y: Int(box.frame.origin.y) + margin + 3, width: buttonSize, height: buttonSize)
        cancelIcon.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancel(_:)))
        cancelIcon.isUserInteractionEnabled = true
        cancelIcon.addGestureRecognizer(tap)
        self.view.addSubview(cancelIcon)
        
        // Image
        let teamImage = UIImageView(image: UIImage(named: "dingoTabling"))
        teamImage.frame = CGRect(x: w/6, y: h/4, width: w*2/3, height: w*2/3)
        self.view.addSubview(teamImage)
        
        // Dingo
        let dingoSize = 100
        let dingo = UIImageView(image: UIImage(named: "dingoCircle"))
        dingo.frame = CGRect(x: Int(teamImage.frame.origin.x + teamImage.frame.width) - dingoSize, y: Int(teamImage.frame.origin.y + teamImage.frame.height) - dingoSize, width: dingoSize, height: dingoSize)
        self.view.addSubview(dingo)
    }
    
    func drawDescription() {
        let boxTop = h*3/5
        let boxH = h/4
        let box = UIView(frame: CGRect(x: w/6, y: boxTop, width: w*2/3, height: boxH))
        box.backgroundColor = tertiaryColor
        
        box.layer.shadowColor = UIColor.black.cgColor
        box.layer.shadowOpacity = 0.3
        box.layer.shadowOffset = CGSize(width: 0, height: 3)
        box.layer.shadowRadius = 4
        
        
        let dLabel = UILabel()
        dLabel.frame = CGRect(x: w/4, y: boxTop, width: w/2, height: boxH)
        dLabel.backgroundColor = UIColor.clear
        dLabel.textColor = mainColor
        dLabel.textAlignment = .center
        dLabel.lineBreakMode = .byWordWrapping
        dLabel.numberOfLines = 8
        dLabel.font = smallFont
        
        let d = NSMutableAttributedString(
            string: "Dingo was the child of 7 students who wanted to make the Berkeley atmosphere a little safer. \n \n Questions? Bugs? \n jennifer.lu@berkeley.edu",
            attributes: [NSAttributedString.Key.font:UIFont(
                name: mainFont,
                size: 16)!])
        
        d.addAttribute(NSAttributedString.Key.font,
                       value: UIFont(
                       name: boldFont,
                       size: 16)!,
                       range: NSRange(
                        location:116,
                        length:24))
        
        dLabel.attributedText = d
        
        
        self.view.addSubview(box)
        self.view.addSubview(dLabel)
    }
    
    @objc func cancel(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
    func drawHomeButton() {
        home = UIImageView(image: UIImage(named: "home"))
        home.frame.size = CGSize(width: home.image!.size.width / 16, height: home.image!.size.width / 16)
        home.center.x = self.view.bounds.midX
        home.center.y = self.view.bounds.height - 100
        home.isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toHome(_:)))
        home.isUserInteractionEnabled = true
        home.addGestureRecognizer(tap)
        self.view.addSubview(home)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
