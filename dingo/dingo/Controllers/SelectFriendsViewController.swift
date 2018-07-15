//
//  SelectFriendsViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/8/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import SwiftyJSON

class SelectFriendsViewController: UIViewController {

    var userData: [String: AnyObject] = [:]
    var helloLabel = UILabel()
    var helloContainer: UIView!
    var friendsJSON: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userData)
        view.backgroundColor = FlatBlue()
        print("did background")
        drawContainers()
        print("did containers")
        drawHelloLabel()
        print("did hello label")
        self.view.addSubview(helloContainer)
        print("added container subview")
        drawNextButton()
        print("drew everything??")
    }
    
    func drawHelloLabel() {
        guard let name = userData["name"] as? String else { return }
        helloLabel.text = "Welcome " + name + "!"
        helloLabel.textColor = FlatWhite()
        helloLabel.textAlignment = .center
        helloLabel.frame = helloContainer.frame
        helloContainer.addSubview(helloLabel)
    }
    
    func drawContainers() {
        helloContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.midY))
        helloContainer.center =  CGPoint(x: helloContainer.frame.midX, y: helloContainer.frame.midY)
    }
    
    func drawNextButton() {
        let nextButton = UIButton()
        nextButton.backgroundColor = FlatWhite()
        nextButton.tag = 1
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.setTitle("To map", for: [])
        nextButton.setTitleColor(FlatBlue(), for: .normal)
        nextButton.addTarget(self, action: #selector(pressNext(_:)), for: .touchUpInside)
        print("did all the nextButton's properties")
        self.view.addSubview(nextButton)
        print("added button to subview")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func pressNext(_ button: UIButton) {
        print("Button with tag: \(button.tag) clicked!")
        performSegue(withIdentifier: "friendsToMap", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}