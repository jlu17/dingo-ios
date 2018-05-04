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
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    var introLabel = UILabel()
    var whoLabel = UILabel()
    var whereLabel = UILabel()
    var container1: UIView!
    var container2: UIView!
    var settingsButton: UIBarButtonItem!
    var dingoCircleView: UIImageView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        view.backgroundColor = FlatBlue()
        
        drawStartButton()
        drawContainers()
        drawLabels()
        
        // Gear icon
        settingsButton = UIBarButtonItem(title: NSString(string: "\u{2699}\u{0000FE0E}") as String, style: .plain, target: self, action: #selector(settings))
        
        // let font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(container1)
        self.view.addSubview(container2)
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
    
    func drawContainers() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: self.view.bounds.midY))
        container1.center =  CGPoint(x: container1.bounds.midX, y: container1.bounds.midY)
        container2 = UIView(frame: CGRect(x: 0, y: 250, width: screenWidth, height: self.view.bounds.midY))
        container2.center =  CGPoint(x: container2.bounds.midX, y: container2.bounds.midY)
    }
    
    func drawLabels() {
        introLabel.text = "Tap the dingo to start journey."
        introLabel.textColor = FlatWhite()
        introLabel.textAlignment = .center
        introLabel.frame = container1.frame
        
        whoLabel.text = "Notifying Jennifer"
        whoLabel.textColor = FlatWhite()
        whoLabel.textAlignment = .center
        whoLabel.frame = container2.frame
        
        whereLabel.text = "Going to Unit 1"
        whereLabel.textColor = FlatWhite()
        whereLabel.textAlignment = .center
        whereLabel.frame = container2.frame
        
        container1.addSubview(introLabel)
        container2.addSubview(whoLabel)
        container2.addSubview(whereLabel)
    }

    @objc func startJourney(_ Sender: Any?) {
        print("Circle clicked!")
        performSegue(withIdentifier: "homepageToProgress", sender: nil)
    }
    
    @objc func settings(_ Sender: Any?) {
        print("Settings clicked!")
        // performSegue(withIdentifier: "homepageToProgress", sender: nil)
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
