//
//  SettingsViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 5/3/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import FBSDKLoginKit
import Firebase

class SettingsViewController: UIViewController, FBSDKLoginButtonDelegate {
    var locButton: UIButton!
    var friendsButton: UIButton!
    var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = FlatWhite()
        drawLocButton()
        drawFriendsButton()
        drawAboutButton()
        drawLogInButton()
    }
    
    func drawLocButton() {
        locButton = UIButton()
        locButton.backgroundColor = .clear
        //locButton.layer.cornerRadius = 5
        locButton.layer.borderWidth = 1
        locButton.layer.borderColor = mainColor.cgColor
        locButton.frame.size = CGSize(width: self.view.bounds.width / 1.5, height: self.view.bounds.width / 8)
        locButton.center.x = self.view.center.x
        locButton.center.y = self.view.bounds.height / 2 - 50
        locButton.setTitle("Change Default Location", for: [])
        locButton.setTitleColor(mainColor, for: .normal)
        locButton.addTarget(self, action: #selector(changeLocAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(locButton)
    }
    
    func drawFriendsButton() {
        friendsButton = UIButton()
        friendsButton.backgroundColor = .clear
        //locButton.layer.cornerRadius = 5
        friendsButton.layer.borderWidth = 1
        friendsButton.layer.borderColor = mainColor.cgColor
        friendsButton.frame.size = CGSize(width: self.view.bounds.width / 1.5, height: self.view.bounds.width / 8)
        friendsButton.center.x = self.view.center.x
        friendsButton.center.y = self.view.bounds.height / 2
        friendsButton.setTitle("Change Default Friends", for: [])
        friendsButton.setTitleColor(mainColor, for: .normal)
        friendsButton.addTarget(self, action: #selector(changeFriendAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(friendsButton)
    }
    
    func drawAboutButton() {
        aboutButton = UIButton()
        aboutButton.backgroundColor = .clear
        //locButton.layer.cornerRadius = 5
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = mainColor.cgColor
        aboutButton.frame.size = CGSize(width: self.view.bounds.width / 1.5, height: self.view.bounds.width / 8)
        aboutButton.center.x = self.view.center.x
        aboutButton.center.y = self.view.bounds.height / 2 + 50
        aboutButton.setTitle("About", for: [])
        aboutButton.setTitleColor(mainColor, for: .normal)
        aboutButton.addTarget(self, action: #selector(aboutAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(aboutButton)
    }
    
    @objc func changeLocAction(_ button: UIButton) {
        performSegue(withIdentifier: "changeLoc", sender: nil)
    }
    
    @objc func changeFriendAction(_ button: UIButton) {
        performSegue(withIdentifier: "changeFriend", sender: nil)
    }
    
    @objc func aboutAction(_ button: UIButton) {
        performSegue(withIdentifier: "toAbout", sender: nil)
    }
    
    func drawLogInButton() {
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 100, height: 40)
        loginButton.center.x = self.view.bounds.midX
        loginButton.center.y = view.frame.height - 70
        //To add permissions
        loginButton.readPermissions = ["user_friends", "public_profile"]
        view.addSubview(loginButton)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logging out")
        self.performSegue(withIdentifier: "unwindSegueToLogIn", sender: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
