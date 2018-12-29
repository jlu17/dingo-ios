//
//  LogOutViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/21/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class LogOutViewController: UIViewController {
    
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor.withAlphaComponent(0.8)
        w = self.view.bounds.width
        h = self.view.bounds.height
        view.isOpaque = false
        print("in logout screen")
        drawAlert()
        print(self.presentingViewController)
        print(self.view.window?.rootViewController)


    }
    
    func drawAlert() {
        let back=UIView(frame:CGRect(x: w/4, y:(h-w/2)/2, width: w/2, height: w/2))
        back.backgroundColor = UIColor.white
        self.view.addSubview(back)
        
        let alertText = UILabel()
        let margin = 30
        
        
        alertText.frame = CGRect(x: Int(back.frame.origin.x) + margin, y: Int(back.frame.origin.y) + 20, width: Int(back.frame.width) - 2*margin, height: Int(back.frame.height / 2))
        alertText.text = "Are you sure you want to log out?"
        alertText.font = regularFont
        alertText.lineBreakMode = NSLineBreakMode.byWordWrapping
        alertText.numberOfLines = 4
        alertText.textColor = mainColor
        alertText.textAlignment = .center
        self.view.addSubview(alertText)
        
        let optionY = alertText.frame.origin.y + alertText.frame.height + 20
        let optionWidth = alertText.frame.width / 2
        
        drawAlertButton(name: "Yes", frame: CGRect(x: alertText.frame.origin.x, y: optionY, width: optionWidth, height: 30), action: #selector(logOut(_:)), color: pink, alignment: .left)
        
        drawAlertButton(name: "No", frame: CGRect(x: alertText.frame.origin.x + optionWidth, y: optionY, width: optionWidth, height: 30), action: #selector(cancel(_:)), color: mainColor, alignment: .right)
        
    }
    
    func drawAlertButton(name: String, frame: CGRect, action: Selector, color: UIColor, alignment: UIControl.ContentHorizontalAlignment) {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = subTitleFont
        button.frame = frame
        button.setTitle(name, for: [])
        button.setTitleColor(color, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.contentHorizontalAlignment = alignment

        self.view.addSubview(button)
    }
    
    @objc func logOut(_ sender: Any?) {
        // let loginManager = FBSDKLoginManager()
        // loginManager.logOut()
        print("log out clicked")
//        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {
//            UIApplication.shared.keyWindow?.rootViewController?.navigationController?.popToRootViewController(animated: true)
//            })

        // self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)

        // self.navigationController?.popToRootViewController(animated: true)
        
        self.performSegue(withIdentifier: "unwindSegueToSplash", sender: nil)
    }
    
    
    @objc func cancel(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
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
