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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = FlatBlue()
        drawDescription()
        drawHomeButton()
    }
    
    @objc func toHome(_ button: UIButton) {
        self.performSegue(withIdentifier: "aboutToHome", sender: nil)
    }
    
    func drawDescription() {
        container = UIView(frame: CGRect(x: 40, y: 40, width: self.view.bounds.width - 160, height: self.view.bounds.height - 160))
        container.center =  CGPoint(x: container.frame.midX, y: container.frame.midY)
        
        des.frame = container.frame
        des.lineBreakMode = NSLineBreakMode.byWordWrapping
        des.numberOfLines = 0
        des.text = "Hey! I'm Jennifer Lu, working on this project solo for the iOS decal. Currently swamped with finals, so will be working on the backend very soon, but hope you enjoy the front end (mostly += a few bugs). :)"
        des.textColor = FlatWhite()
        des.textAlignment = .center
        container.addSubview(des)
        self.view.addSubview(container)
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
