//
//  SwiftyAPIClient.swift
//  dingo
//
//  Created by Jennifer Lu on 7/15/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import Foundation
import SwiftyJSON

class SwiftyAPIClient {
//    var json: JSON!
    
    init() {
//        self.json = JSON(result!)
//        print(self.json)
//        let friendJSONArray = self.json["data"].arrayValue
    }
    
    func handleFriendsList(id: String, result: NSDictionary) {
        let firebaseClient = FirebaseAPIClient()
        
        let json = JSON(result)
        print(json)
        let friendJSONArray = json["data"].arrayValue
        
        //iterate through friends list and save to Firebase
        for friendJSON in friendJSONArray {
            let friendID = friendJSON["id"].stringValue
            let friendName = friendJSON["name"].stringValue
            firebaseClient.setDatabaseFriend(id: id, friendID: friendID, friendName: friendName)
        }
        
//                let nextPageToken = self.json["paging"]["cursors"]["after"].stringValue
//                let prevPageToken = self.json["paging"]["cursors"]["before"].stringValue'
    }
}
