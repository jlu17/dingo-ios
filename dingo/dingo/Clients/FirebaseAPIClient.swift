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
    
    func getFriendPhotoURL(friendID: String, completion: @escaping (_ photoURL: String) -> Void) {
        print("friendID: ", friendID)
        self.dbRef.child("Users").child(friendID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let photoURL = value?["photo"] as! String
            completion(photoURL)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
