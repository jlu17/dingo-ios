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
    var friends: [String]
//    var name: String
//    var id: String   //A unique ID that is used to persist data about the user to the database (Firebase).
    let dbRef = Database.database().reference()

    init() {
//        let currentUser = Auth.auth().currentUser
//        print(currentUser!)
//        self.id = (currentUser?.uid)!
//        dbRef.child("Users").child(self.id).child("name").setValue(currentUser?.displayName)
        
        // self.name = dbRef.child("Users").child(id).value(forKey: id) as! String
        // print(self.name, " ", self.id)
        friends = []
    
//        dbRef.child("Users").child(id).child("friends").observeSingleEvent(of: .value, with: { (snapshot) in
//            let arr = snapshot.value as? [String:String]
//            print("arr: ", arr!)
//            if arr != nil {
//                for (_, value) in arr! {
//                    postArray.append(value)
//                }
//            }
//        })
        
    }
}
