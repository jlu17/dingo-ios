//
//  NotificationsViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/22/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        drawCancelButton()
        // Do any additional setup after loading the view.
    }
    
    func drawCancelButton() {
        let cancelButton = UIButton()
        cancelButton.frame.size = CGSize(width: self.view.bounds.midX, height:  45)
        cancelButton.center.x = self.view.bounds.midX
        cancelButton.center.y = self.view.bounds.midY + 100
        cancelButton.backgroundColor = UIColor.clear
        cancelButton.tag = 1
        cancelButton.setTitle("Cancel", for: [])
        cancelButton.setTitleColor(pink, for: [])
        cancelButton.addTarget(self, action: #selector(cancel(_:)), for: .touchUpInside)
        
        self.view.addSubview(cancelButton)
    }
    
    @objc @IBAction func cancel(_ sender: Any?) {
        print("Cancel button clicked!")
        performSegue(withIdentifier: "unwindNotifications", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
