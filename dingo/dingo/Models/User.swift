//
//  User.swift
//  dingo
//
//  Created by Jennifer Lu on 5/2/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var photo: String //must be stored as a string for the filename.
    var listOfFriendsOnTheApp: NSArray
    var email: String
    var userID: String   //A unique ID that is used to persist data about the user to the database (Firebase).
    
    
    init(firstName: String, lastName: String, photo: String, email:String, userID: String){
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
        self.listOfFriendsOnTheApp = []
        self.email = email
        self.userID = userID
    }
}
