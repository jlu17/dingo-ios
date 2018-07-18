//  FacebookAPIClient.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FirebaseAuth

//TO DO: COMPLETELY MOVE FIREBASE STUFF TO THE FIREBASEAPICLIENT FILE

class FacebookAPIClient {
    
    func handleFBLogin(completion: @escaping (_ success: Bool) -> Void) {
        // Do something
        
        let firebaseClient = FirebaseAPIClient()
        let swiftyClient = SwiftyAPIClient()
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Firebase login error:", error)
                return
            }
            
            print("===Logged into Firebase successfully===")
            
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, first_name, last_name, picture"]).start(completionHandler: { (connection, result, error) -> Void in
                if error != nil {
                    print("Failed to start graph request:", error!)
                    return
                }
                
                //print("===got public data===")
                let userData = result as! [String : AnyObject]
                print("userData: ", result!)
                
                firebaseClient.updateDatabaseUser(info: userData)
                // self.dbRef.child("Users").child(id).child("setup").setValue(true)
                
                //friends list
                FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields":""]).start(completionHandler: { (connection, result, error) -> Void in
                    if error != nil {
                        print("Failed to start graph request for friends:", error!)
                        return
                    }
                    print("===Got friend data from FBSDKGraphRequest===")
                    swiftyClient.handleFriendsList(id: userData["id"] as! String, result: result! as! NSDictionary)
                    
                    completion(true)
                })
            })
        }
    }
    
    func getFacebookID() -> String {
        
        return FBSDKAccessToken.current().userID
    }
}
