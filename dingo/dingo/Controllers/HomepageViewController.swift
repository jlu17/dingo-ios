//
//  HomepageViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomepageViewController: UIViewController {
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) { }
    var introLabel = UILabel()
    var whoLabel = UILabel()
    var whereLabel = UILabel()
    var container1: UIView!
    var container2: UIView!
    var settingsButton: UIButton!
    var dingoCircleView: UIImageView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        view.backgroundColor = mainColor
        drawContainers()
        drawLabels()
        
        // Gear icon
        
        
        // let font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(container1)
        self.view.addSubview(container2)
        drawSettingsButton()
        drawStartButton()
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
    
    func drawSettingsButton() {
        //settingsButton = UIBarButtonItem(title: NSString(string: "\u{2699}\u{0000FE0E}") as String, style: .plain, target: self, action: #selector(settings))
        settingsButton = UIButton()
        settingsButton.frame.size = CGSize(width: 45, height:  45)
        settingsButton.center.x = self.view.bounds.width - 50
        settingsButton.center.y = 60
        settingsButton.backgroundColor = mainColor
        settingsButton.tag = 1
        settingsButton.setTitle(NSString(string: "\u{2699}\u{0000FE0E}") as String, for: [])
        settingsButton.setTitleColor(FlatWhite(), for: [])
        settingsButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 40)
        settingsButton.addTarget(self, action: #selector(settings(_:)), for: .touchUpInside)
        
        self.view.addSubview(settingsButton)
    }
    
    func drawContainers() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: self.view.bounds.midY))
        container1.center =  CGPoint(x: container1.frame.midX, y: container1.frame.midY)
        container2 = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: self.view.bounds.height))
        container2.center =  CGPoint(x: container2.frame.midX, y: container2.frame.midY * 1.25)
    }
    
    func drawLabels() {
        introLabel.text = "Tap the dingo to start journey."
        introLabel.font = introLabel.font.withSize(20)
        introLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        introLabel.numberOfLines = 0
        introLabel.textColor = FlatWhite()
        introLabel.textAlignment = .center
        introLabel.frame = container1.frame
        
        whoLabel.text = "Notifying Jennifer \n Going to Unit 1"
        whoLabel.textColor = FlatWhite()
        whoLabel.font = whoLabel.font.withSize(20)
        whoLabel.numberOfLines = 0
        whoLabel.textAlignment = .center
        whoLabel.frame = container2.frame
        
        container1.addSubview(introLabel)
        container2.addSubview(whoLabel)
    }

    @objc func startJourney(_ Sender: Any?) {
        print("Circle clicked!")
        performSegue(withIdentifier: "homepageToProgress", sender: nil)
    }
    
    @objc func settings(_ Sender: Any?) {
        print("Settings clicked!")
        performSegue(withIdentifier: "toSettings", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
