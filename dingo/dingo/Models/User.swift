//
//  User.swift
//  dingo
//
//  Created by Jennifer Lu on 5/2/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class User {
//    var photo: String //must be stored as a string for the filename.
    var friends: [String: String] = [:]
    var name = ""
    var firebaseID: String
    var facebookID: String
    let dbRef = Database.database().reference()
    var friendsSelected: [String] = []

    init () {
        // Do something
        let currentUser = Auth.auth().currentUser
        print("current user: ", currentUser!)
        self.firebaseID = (currentUser?.uid)!
        self.facebookID = FacebookAPIClient().getFacebookID()
        print("facebookID: ", self.facebookID)
        
        dbRef.child("Users").child(self.facebookID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.name = value?["name"] as! String
            print("self.name: ", self.name)
            self.friends = value?["friends"] as! [String: String]
        }) { (error) in
            print("Error reading user: ", error.localizedDescription)
        }
    }
    
    func numberOfFriends() -> Int {
        return friends.count
    }
}
