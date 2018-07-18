//
//  FirebaseAPIClient.swift
//  dingo
//
//  Created by Jennifer Lu on 4/13/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseAPIClient {
    var dbRef: DatabaseReference!
    init() {
        dbRef = Database.database().reference()
    }
    
    func setDatabaseFriend(id: String, friendID: String, friendName: String) {
        self.dbRef.child("Users").child(id).child("friends").child(friendID).setValue(friendName)
    }
    
    func updateDatabaseUser(info: [String: AnyObject]) {
        let id = info["id"] as! String
        let firebaseUser = self.dbRef.child("Users").child(id)
        
        firebaseUser.child("first_name").setValue(info["first_name"] as! String)
        firebaseUser.child("last_name").setValue(info["last_name"] as! String)
        firebaseUser.child("name").setValue(info["name"] as! String)
        
        let picture = info["picture"] as! [String: AnyObject]
        let pictureData = picture["data"] as! [String: AnyObject]
        firebaseUser.child("photo").setValue(pictureData["url"] as! String)
    }
    
}
