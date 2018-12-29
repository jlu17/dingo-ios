//
//  SplashViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/28/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class SplashViewController: UIViewController {
    var newUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        drawDingo()
        print("HELLO - testing FBSDKAccessToken")
        print(FBSDKAccessToken.current())
        if ((FBSDKAccessToken.current()) != nil) {
            print("user is logged in")
            // self.newUser = User()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                print("segue-ing...")
                self.performSegue(withIdentifier: "splashToHome", sender: self)
            })
        } else {
            print("user is not ")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                print("segue-ing...")
                self.performSegue(withIdentifier: "splashToLogin", sender: self)
                
            })
        }
    }
    
    func drawDingo() {
        let dingo = UIImageView(image: UIImage(named: "dingo_transparent"))
        dingo.frame.size = CGSize(width: dingo.image!.size.width / 32, height: dingo.image!.size.height / 32)
        dingo.center = self.view.center
        dingo.isOpaque = false
        self.view.addSubview(dingo)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToSplash(segue:UIStoryboardSegue) { }
}
