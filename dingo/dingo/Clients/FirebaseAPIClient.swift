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
    
    func handleDatabaseUser(info: [String: AnyObject]) {
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
        self.dbRef.child("Users").child(friendID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print("friendID: ", friendID)
            let value = snapshot.value as? NSDictionary
            let photoURL = value!["photo"] as! String
            completion(photoURL)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func handleFirebaseSelectedIDs(id: String, friendIDList: [String]) {
        let pack = self.dbRef.child("Users").child(id).child(firebasePack)
        pack.removeValue()
        
        for friendID in friendIDList {
            pack.child(friendID).setValue(true)
        }
    }
    
    func handleFirebaseLocation(id: String, long: Double, lat: Double) {
        let userLoc = self.dbRef.child("Users").child(id).child("location")
        userLoc.child("longitude").setValue(long)
        userLoc.child("latitude").setValue(lat)
    }
}
