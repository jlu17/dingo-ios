//
//  FBLoginPage.swift
//  dingo
//
//  Created by Jennifer Lu on 4/4/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.

import UIKit
import FBSDKLoginKit
import Firebase
import ChameleonFramework
import FirebaseDatabase


class FBLoginPage: UIViewController, FBSDKLoginButtonDelegate {
    var dingo: UIImageView!
    var introLabel = UILabel()
    var container1: UIView!
    var dbRef : DatabaseReference!
    var id: String!
    var newUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference()
        
        view.backgroundColor = FlatWhite()
        drawDingo()
        drawContainers()
        drawIntroLabel()
        drawLogInButton()
        self.view.addSubview(container1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawContainers() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.midY))
        container1.center =  CGPoint(x: container1.frame.midX, y: container1.frame.midY)
    }
    
    func drawIntroLabel() {
        introLabel.text = "To use Dingo, please log in."
        introLabel.textColor = FlatBlue()
        introLabel.textAlignment = .center
        introLabel.frame = container1.frame
        container1.addSubview(introLabel)
    }
    
    func drawDingo() {
        dingo = UIImageView(image: UIImage(named: "dingo_transparent"))
        dingo.frame.size = CGSize(width: dingo.image!.size.width / 16, height: dingo.image!.size.height / 16)
        dingo.center = self.view.center
        dingo.isOpaque = false
        self.view.addSubview(dingo)
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
        print("logging in...")
        //error
        if error != nil {
            print(error)
            return
        }
        
        FacebookAPIClient().handleFBLogin { (success) -> Void in
            if success {
                self.newUser = User()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    print("segue-ing...")
                    self.performSegue(withIdentifier: "loginToFriends", sender: nil)
                })
            }
        }
    }
    
    // WHEN LOGOUT BUTTON IS LOGGED OUT
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
        
        // TO IMPLEMENT INTO CUSTOM FB LOGIN HEREEEE
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavigationController = segue.destination as? UINavigationController {
            destinationNavigationController.isNavigationBarHidden = true
            let destination = destinationNavigationController.topViewController as! SelectFriendsViewController
            destination.currentUser = newUser
        }
    }
    @IBAction func unwindToStart(segue:UIStoryboardSegue) { }
}


