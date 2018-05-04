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
        view.backgroundColor = FlatBlue()
        drawContainers()
        drawLabels()
        drawCancelButton()
        self.view.addSubview(container1)
    }
    
    func drawContainers() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        container1.center =  CGPoint(x: container1.bounds.midX, y: container1.bounds.midY)
    }
    
    func drawLabels() {
        progressLabel.text = "Going home..."
        progressLabel.textColor = FlatWhite()
        progressLabel.textAlignment = .center
        progressLabel.frame = container1.frame
    
        container1.addSubview(progressLabel)
    }

    func drawCancelButton() {
        cancelButton = UIButton()
        cancelButton.frame.size = CGSize(width: self.view.bounds.midX, height:  45)
        cancelButton.center = self.view.center
        cancelButton.backgroundColor = FlatWhite()
        cancelButton.tag = 1
        cancelButton.setTitle("Cancel, I'm safe.", for: [])
        cancelButton.setTitleColor(FlatBlack(), for: [])
        cancelButton.addTarget(self, action: #selector(cancelJourney(_:)), for: .touchUpInside)
        
        self.view.addSubview(cancelButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc @IBAction func cancelJourney(_ sender: Any) {
        
        performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
