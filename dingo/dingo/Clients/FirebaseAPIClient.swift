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
    
    func setDatabaseName(id: String, name: String) {
        self.dbRef.child("Users").child(id).child("name").setValue(name)
    }
    
    func setDatabaseFriend(id: String, friendID: String, friendName: String) {
        self.dbRef.child("Users").child(id).child("friends").child(friendID).setValue(friendName)
    }
    
}
