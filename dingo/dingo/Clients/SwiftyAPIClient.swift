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
    
    init() {
    }
    
    func getFriendsJSON(result: NSDictionary) -> NSMutableDictionary {
        let jsonArr = JSON(result)["data"].arrayValue
        var nsArr: NSMutableDictionary = [:]
        for json in jsonArr {
            print("name: ", json["name"].stringValue, "id: ", json["id"].stringValue)
            nsArr.setValue(json["name"].stringValue, forKey: json["id"].stringValue)
        }
        return nsArr
    }
}
