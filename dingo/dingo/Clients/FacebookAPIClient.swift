//
//  FacebookAPIClient.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import Firebase

class FacebookAPIClient {
    @objc func handleCustomFBLogin() {
        
        FBSDKLoginManager().logIn(withReadPermissions: [], from: FBLoginPage()) { (result, err) in
            if err != nil {
                print("Custom FB Login failed:", err!)
                return
            }
            
            //self.showEmailAddress()
            
            // SENDING INFO TO FIREBASE
            // Gets access token
            let accessToken = FBSDKAccessToken.current()
            guard let accessTokenString = accessToken?.tokenString else { return }
            
            let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            Auth.auth().signIn(with: credentials, completion: { (user, error) in
                // Check for error
                if error != nil {
                    print("Something went wrong with our FB user: ", error ?? "")
                    return
                }
                print("Successfully logged in with our user: ", user ?? "")
            })
            
            
            // Regular--gets the name and id
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name"]).start { (connection, result, err) in
                
                if err != nil {
                    print("Failed to start graph request:", err ?? "")
                    return
                }
                print(result!)
            }
        }
    }
}
