//
//  ProgressViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework

class ProgressViewController: UIViewController {

    var container1: UIView!
    var progressLabel = UILabel()
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        drawContainers()
        drawLabels()
        drawCancelButton()
        self.view.addSubview(container1)
    }
    
    func drawContainers() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.midY))
        container1.center =  CGPoint(x: container1.frame.midX, y: container1.frame.midY * 1.5)
    }
    
    func drawLabels() {
        progressLabel.text = "Going home..."
        progressLabel.textColor = FlatWhite()
        progressLabel.font = progressLabel.font.withSize(20)
        progressLabel.textAlignment = .center
        progressLabel.frame = container1.frame
        container1.addSubview(progressLabel)
    }

    func drawCancelButton() {
        cancelButton = UIButton()
        cancelButton.frame.size = CGSize(width: self.view.bounds.midX, height:  45)
        cancelButton.center.x = self.view.bounds.midX
        cancelButton.center.y = self.view.bounds.midY + 100
        cancelButton.backgroundColor = FlatWhite()
        cancelButton.tag = 1
        cancelButton.setTitle("Cancel, I'm safe.", for: [])
        cancelButton.setTitleColor(mainColor, for: [])
        cancelButton.addTarget(self, action: #selector(cancelJourney(_:)), for: .touchUpInside)
        
        self.view.addSubview(cancelButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc @IBAction func cancelJourney(_ sender: Any) {
        
        performSegue(withIdentifier: "unwindToHome", sender: self)
    }

}
