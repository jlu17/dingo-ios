//
//  ChangeFriendViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 5/3/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import SwiftyJSON

class ChangeFriendViewController: UIViewController {
    var userData: [String: AnyObject] = [:]
    var helloLabel = UILabel()
    var helloContainer: UIView!
    var friendsJSON: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userData)
        view.backgroundColor = mainColor
        drawContainers()
        drawHelloLabel()
        self.view.addSubview(helloContainer)
        
        let nextButton = UIButton()
        nextButton.backgroundColor = FlatWhite()
        nextButton.tag = 1
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.setTitle("Done", for: [])
        nextButton.setTitleColor(mainColor, for: .normal)
        nextButton.addTarget(self, action: #selector(pressNext(_:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
    }
    
    func drawHelloLabel() {
        helloLabel.text = "Choose your friend wisely."
        helloLabel.textColor = FlatWhite()
        helloLabel.textAlignment = .center
        helloLabel.frame = helloContainer.frame
        helloContainer.addSubview(helloLabel)
    }
    
    func drawContainers() {
        helloContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.midY))
        helloContainer.center =  CGPoint(x: helloContainer.frame.midX, y: helloContainer.frame.midY)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pressNext(_ button: UIButton) {
        self.performSegue(withIdentifier: "friendsToHome", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
