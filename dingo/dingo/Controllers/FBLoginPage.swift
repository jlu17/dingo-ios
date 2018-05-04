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
import SwiftyJSON

class FBLoginPage: UIViewController, FBSDKLoginButtonDelegate {
    var userData: [String: AnyObject] = [:]
    var dingo: UIImageView!
    var introLabel = UILabel()
    var container1: UIView!
    var json: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
//        let loginManager = FBSDKLoginManager()
//        let permissions = ["public_profile", "email", "user_friends"]
//        let handler = ...
//            loginManager.logInWithReadPermissions(permissions, fromViewController: self, handler: handler)
    
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name"]).start(completionHandler: { (connection, result, error) -> Void in
            if error != nil {
                print("Failed to start graph request:", error!)
                return
            } else {
                print("got public data")
                self.userData = result as! [String : AnyObject]
                print(result!)
                print(self.userData)
                //self.performSegue(withIdentifier: "loginToFriends", sender: self)
            }
        })
        
        FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields":""]).start(completionHandler: { (connection, result, error) -> Void in
            if error != nil {
                print("Failed to start graph request:", error!)
                return
            } else {
                print("got friend data")
                self.json = JSON(result!)
                let friendJSONArray = self.json["data"].arrayValue
                for friendJSON in friendJSONArray {
                    print(friendJSON["name"].stringValue)
                    print(friendJSON["id"].intValue)
                }
//                let nextPageToken = self.json["paging"]["cursors"]["after"].stringValue
//                let prevPageToken = self.json["paging"]["cursors"]["before"].stringValue
                print("segue-ing...")
                self.performSegue(withIdentifier: "loginToFriends", sender: self)
            }
        })
        
//        let graphRequest = FBSDKGraphRequest(graphPath: "/me/friends", parameters: params)
//        let connection = FBSDKGraphRequestConnection()
//        connection.add(graphRequest, completionHandler: { (connection, result, error) in
//            if error == nil {
//                if let userData = result as? [String:Any] {
//                    print(userData)
//                }
//            } else {
//                print("Error Getting Friends \(error)");
//            }
//
//        })
//
//        connection.start()

    }
    
    // WHEN LOGOUT BUTTON IS LOGGED OUT
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
        
        // TO IMPLEMENT INTO CUSTOM FB LOGIN HEREEEE
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectFriendsViewController {
            destination.userData = self.userData
            destination.friendsJSON = self.json
        }
    }
    @IBAction func unwindToStart(segue:UIStoryboardSegue) { }
}
