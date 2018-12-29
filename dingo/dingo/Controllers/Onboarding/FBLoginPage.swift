//
//  FBLoginPage.swift
//  dingo
//
//  Created by Jennifer Lu on 4/4/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.

import UIKit
// import FBSDKLoginKit
import Firebase
import ChameleonFramework
import FirebaseDatabase
import FacebookLogin

class FBLoginPage: UIViewController, LoginButtonDelegate {
    
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
        introLabel.textColor = mainColor
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
        
        let loginButton = LoginButton(readPermissions: [.publicProfile, .userFriends])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        loginButton.delegate = self
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 100, height: 40)
        loginButton.center.x = self.view.bounds.midX
        loginButton.center.y = view.frame.height - 70
        //To add permissions
        view.addSubview(loginButton)
    }
    
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
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
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("logged out")
        
        // TO IMPLEMENT INTO CUSTOM FB LOGIN HEREEEE
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? SelectFriendsViewController {
            destination.currentUser = newUser
        }
    }
    
    @IBAction func unwindToStart(segue:UIStoryboardSegue) { }
}


